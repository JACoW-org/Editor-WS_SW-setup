# This file was automatically generated on 2022-11-10 17:35:55 +0100.
# Use the 'puppet generate types' command to regenerate this file.

# @summary This type provides Puppet with the capabilities to manage GPG keys needed
#   by apt to perform package validation. Apt has it's own GPG keyring that can
#   be manipulated through the `apt-key` command.
# 
# @example Basic usage
#   apt_key { '6F6B15509CF8E59E6E469F327F438280EF8D349F':
#     source => 'http://apt.puppetlabs.com/pubkey.gpg'
#   }
# 
# **Autorequires**
# 
# If Puppet is given the location of a key file which looks like an absolute
# path this type will autorequire that file.
# 
# @api private
Puppet::Resource::ResourceType3.new(
  'apt_key',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The 40-digit hexadecimal fingerprint of the specified GPG key.
    # 
    # This property is read-only.
    Puppet::Resource::Param(Any, 'fingerprint'),

    # The 16-digit hexadecimal id of the specified GPG key.
    # 
    # This property is read-only.
    Puppet::Resource::Param(Any, 'long'),

    # The 8-digit hexadecimal id of the specified GPG key.
    # 
    # This property is read-only.
    Puppet::Resource::Param(Any, 'short'),

    # Indicates if the key has expired.
    # 
    # This property is read-only.
    Puppet::Resource::Param(Any, 'expired'),

    # The date the key will expire, or nil if it has no expiry date.
    # 
    # This property is read-only.
    Puppet::Resource::Param(Any, 'expiry'),

    # The key size, usually a multiple of 1024.
    # 
    # This property is read-only.
    Puppet::Resource::Param(Any, 'size'),

    # The key type, one of: rsa, dsa, ecc, ecdsa
    # 
    # This property is read-only.
    Puppet::Resource::Param(Any, 'type'),

    # Date the key was created.
    # 
    # This property is read-only.
    Puppet::Resource::Param(Any, 'created')
  ],
  [
    # The ID of the key you want to manage.
    # 
    # Values can match `/\A(0x)?[0-9a-fA-F]{8}\Z/`, `/\A(0x)?[0-9a-fA-F]{16}\Z/`, `/\A(0x)?[0-9a-fA-F]{40}\Z/`.
    Puppet::Resource::Param(Pattern[/\A(0x)?[0-9a-fA-F]{8}\Z/, /\A(0x)?[0-9a-fA-F]{16}\Z/, /\A(0x)?[0-9a-fA-F]{40}\Z/], 'id', true),

    # The content of, or string representing, a GPG key.
    Puppet::Resource::Param(Any, 'content'),

    # Location of a GPG key file, /path/to/file, ftp://, http:// or https://
    # 
    # Values can match `/\Ahttps?:\/\//`, `/\Aftp:\/\//`, `/\A\/\w+/`.
    Puppet::Resource::Param(Pattern[/\Ahttps?:\/\//, /\Aftp:\/\//, /\A\/\w+/], 'source'),

    # The key server to fetch the key from based on the ID. It can either be a domain name or url.
    # 
    # Values can match `/\A((hkp|hkps|http|https):\/\/)?([a-z\d])([a-z\d-]{0,61}\.)+[a-z\d]+(:\d{2,5})?(\/[a-zA-Z\d\-_.]+)*\/?$/`.
    Puppet::Resource::Param(Pattern[/\A((hkp|hkps|http|https):\/\/)?([a-z\d])([a-z\d-]{0,61}\.)+[a-z\d]+(:\d{2,5})?(\/[a-zA-Z\d\-_.]+)*\/?$/], 'server'),

    # Additional options to pass to apt-key's --keyserver-options.
    Puppet::Resource::Param(Any, 'options'),

    # When true, recreate an existing expired key
    # 
    # Valid values are `true`, `false`, `yes`, `no`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false', 'yes', 'no']], 'refresh'),

    # When true and source uses https, accepts download of keys without SSL verification
    # 
    # Valid values are `true`, `false`, `yes`, `no`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false', 'yes', 'no']], 'weak_ssl'),

    # The specific backend to use for this `apt_key`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # apt_key
    # : apt-key provider for apt_key resource
    # 
    #   * Required binaries: `/usr/bin/gpg`, `apt-key`.
    #   * Default for `osfamily` == `debian`.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['id']
  },
  true,
  false)
