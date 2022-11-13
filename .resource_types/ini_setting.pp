# This file was automatically generated on 2022-11-10 15:16:23 -0500.
# Use the 'puppet generate types' command to regenerate this file.

# ini_settings is used to manage a single setting in an INI file
Puppet::Resource::ResourceType3.new(
  'ini_setting',
  [
    # Ensurable method handles modeling creation. It creates an ensure property
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The value of the setting to be defined.
    Puppet::Resource::Param(Any, 'value')
  ],
  [
    # An arbitrary name used as the identity of the resource.
    Puppet::Resource::Param(Any, 'name', true),

    # The name of the section in the ini file in which the setting should be defined.
    Puppet::Resource::Param(Any, 'section'),

    # The name of the setting to be defined.
    Puppet::Resource::Param(Any, 'setting'),

    # Create setting only if the section exists
    # 
    # Valid values are `true`, `false`, `yes`, `no`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false', 'yes', 'no']], 'force_new_section_creation'),

    # The ini file Puppet will ensure contains the specified setting.
    Puppet::Resource::Param(Any, 'path'),

    # Whether to display differences when the setting changes.
    # 
    # Valid values are `true`, `md5`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'md5', 'false']], 'show_diff'),

    # The separator string to use between each setting name and value.
    Puppet::Resource::Param(Any, 'key_val_separator'),

    # The prefix to the section name's header.
    Puppet::Resource::Param(Any, 'section_prefix'),

    # The suffix to the section name's header.
    Puppet::Resource::Param(Any, 'section_suffix'),

    # The character to indent new settings with.
    Puppet::Resource::Param(Any, 'indent_char'),

    # The number of indent_chars to use to indent a new setting.
    Puppet::Resource::Param(Any, 'indent_width'),

    # A flag indicating whether or not the ini_setting should be updated only when called as part of a refresh event
    # 
    # Valid values are `true`, `false`, `yes`, `no`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false', 'yes', 'no']], 'refreshonly'),

    # The specific backend to use for this `ini_setting`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # ruby
    # :
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
