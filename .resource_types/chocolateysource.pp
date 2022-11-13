# This file was automatically generated on 2022-11-10 17:35:55 +0100.
# Use the 'puppet generate types' command to regenerate this file.

# Allows managing sources for Chocolatey. A source can be a
# folder, a CIFS share, a NuGet Http OData feed, or a full
# Package Gallery. Learn more about sources at
# https://chocolatey.org/docs/how-to-host-feed
Puppet::Resource::ResourceType3.new(
  'chocolateysource',
  [
    # Specifies state of resource
    # 
    # Valid values are `present`, `disabled`, `absent`.
    Puppet::Resource::Param(Enum['present', 'disabled', 'absent'], 'ensure'),

    # The location of the source repository. Can be a url pointing to
    # an OData feed (like chocolatey/chocolatey_server), a CIFS (UNC) share,
    # or a local folder. Required when `ensure => present` (the default for
    # `ensure`).
    Puppet::Resource::Param(Any, 'location'),

    # Optional user name for authenticated feeds.
    # Requires at least Chocolatey v0.9.9.0.
    # Defaults to `nil`. Specifying an empty value is the
    # same as setting the value to nil or not specifying
    # the property at all.
    Puppet::Resource::Param(Any, 'user'),

    # Optional priority for explicit feed order when
    # searching for packages across multiple feeds.
    # The lower the number the higher the priority.
    # Sources with a 0 priority are considered no priority
    # and are added after other sources with a priority
    # number.
    # Requires at least Chocolatey v0.9.9.9.
    # Defaults to 0.
    Puppet::Resource::Param(Any, 'priority'),

    # Option to specify whether this source should
    # explicitly bypass any explicitly or system
    # configured proxies.
    # Requires at least Chocolatey v0.10.4.
    # Defaults to false.
    # 
    # Valid values are `true`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false']], 'bypass_proxy'),

    # Option to specify whether this source should
    # visible to Windows user accounts in the Administrators
    # group only.
    # 
    # Requires Chocolatey for Business (C4B) v1.12.2+ and at
    # least Chocolatey v0.10.8 for the setting to be respected.
    # Defaults to false.
    # 
    # Valid values are `true`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false']], 'admin_only'),

    # Option to specify whether this source should be
    # allowed to be used with Chocolatey Self Service.
    # 
    # Requires Chocolatey for Business (C4B) v1.10.0+ with the
    # feature useBackgroundServiceWithSelfServiceSourcesOnly
    # turned on in order to be respected.
    # Also requires at least Chocolatey v0.10.4 for the setting
    # to be enabled.
    # Defaults to false.
    # 
    # Valid values are `true`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false']], 'allow_self_service')
  ],
  [
    # The name of the source. Used for uniqueness.
    Puppet::Resource::Param(Any, 'name', true),

    # Optional user password for authenticated feeds.
    # Not ensurable. Value is not able to be checked
    # with current value. If you need to update the password,
    # update another setting as well.
    # Requires at least Chocolatey v0.9.9.0.
    # Defaults to `nil`. Specifying an empty value is the
    # same as setting the value to nil or not specifying
    # the property at all.
    Puppet::Resource::Param(Any, 'password'),

    # The specific backend to use for this `chocolateysource`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # windows
    # : Windows based provider for chocolateysource type.
    # 
    #   * Required binaries: `C:\ProgramData\chocolatey\choco.exe`.
    #   * Default for `operatingsystem` == `windows`.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
