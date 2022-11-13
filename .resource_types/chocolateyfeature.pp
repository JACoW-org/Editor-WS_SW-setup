# This file was automatically generated on 2022-11-10 17:35:55 +0100.
# Use the 'puppet generate types' command to regenerate this file.

# Allows managing features for Chocolatey. Features are
# configuration that act as feature flippers to turn on or
# off certain aspects of how Chocolatey works.
# Learn more about features at
# https://chocolatey.org/docs/commands-feature
Puppet::Resource::ResourceType3.new(
  'chocolateyfeature',
  [
    # Specifies state of resource
    # 
    # Valid values are `enabled`, `disabled`.
    Puppet::Resource::Param(Enum['enabled', 'disabled'], 'ensure')
  ],
  [
    # The name of the feature. Used for uniqueness.
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `chocolateyfeature`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # windows
    # : Windows based provider for chocolateyfeature type.
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
