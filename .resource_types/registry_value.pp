# This file was automatically generated on 2022-11-10 17:35:56 +0100.
# Use the 'puppet generate types' command to regenerate this file.

# Manages registry values on Windows systems.
Puppet::Resource::ResourceType3.new(
  'registry_value',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The Windows data type of the registry value.
    # 
    # Valid values are `string`, `array`, `dword`, `qword`, `binary`, `expand`.
    Puppet::Resource::Param(Enum['string', 'array', 'dword', 'qword', 'binary', 'expand'], 'type'),

    # The data stored in the registry value.
    Puppet::Resource::Param(Any, 'data')
  ],
  [
    # The path to the registry value to manage.
    Puppet::Resource::Param(Any, 'path', true),

    # The specific backend to use for this `registry_value`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # registry
    # : @summary Registry_value provider
    #   Manages individual Registry values.
    # 
    #   * Default for `operatingsystem` == `windows`.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:^(.*?)\Z)/ => ['path']
  },
  true,
  false)
