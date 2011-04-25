require 'resolv'

class EmailDomainValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << "domain could not be verified" unless valid_email_domain?(value)
  end

  def valid_email_domain?(email)
    return false if email.blank? || email.try(:strip).blank?
    matches = email.match(/\@(.+)/)
    return false if matches.nil? || matches.length < 2
    domain = matches[1]
    return false if domain.blank?
    Resolv::DNS.open do |dns|
      @mx = dns.getresources(domain, Resolv::DNS::Resource::IN::MX)
    end
    @mx.size > 0 ? true : false
  rescue Exception => ex
    # because we were likely physically unable to verify the domain
    # log and just accept the email
    Rails.logger.warn "Failed to verify the domain for '#{email}'. Exception '#{ex.inspect}'."
    true
  end
end

