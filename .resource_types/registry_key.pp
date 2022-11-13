# This file was automatically generated on 2022-11-10 17:35:56 +0100.
# Use the 'puppet generate types' command to regenerate this file.

# Manages registry keys on Windows
Puppet::Resource::ResourceType3.new(
  'registry_key',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure')
  ],
  [
    # The path to the registry key to manage
    Puppet::Resource::Param(Any, 'path', true),

    # Common boolean for munging and validation.
    # 
    # Valid values are `true`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false']], 'purge_values'),

    # The specific backend to use for this `registry_key`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # registry
    # : @summary Registry_key provider
    #   Manages individual Registry keys.
    # 
    #   * Default for `operatingsystem` == `windows`.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:^(.*?)\Z)/ => ['path']
  },
  true,
  false)
