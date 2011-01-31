require 'resolv'

class EmailDomainValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << "domain could not be verified" unless valid_email_domain?(value)
  end

  def valid_email_domain?(email)
    return false if email.squish.blank?
    matches = email.match(/\@(.+)/)
    return false if matches.nil? || matches.length < 2
    domain = matches[1]
    return false if domain.blank?
    Resolv::DNS.open do |dns|
      @mx = dns.getresources(domain, Resolv::DNS::Resource::IN::MX)
    end
    @mx.size > 0 ? true : false
  end
end

