# This file was automatically generated on 2022-11-10 17:35:56 +0100.
# Use the 'puppet generate types' command to regenerate this file.

# ini_subsettings is used to manage multiple values in a setting in an INI file
Puppet::Resource::ResourceType3.new(
  'ini_subsetting',
  [
    # Ensurable method handles modeling creation. It creates an ensure property
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The value of the subsetting to be defined.
    Puppet::Resource::Param(Any, 'value')
  ],
  [
    # An arbitrary name used as the identity of the resource.
    Puppet::Resource::Param(Any, 'name', true),

    # The name of the section in the ini file in which the setting should be defined.
    Puppet::Resource::Param(Any, 'section'),

    # The name of the setting to be defined.
    Puppet::Resource::Param(Any, 'setting'),

    # The name of the subsetting to be defined.
    Puppet::Resource::Param(Any, 'subsetting'),

    # The separator string between subsettings. Defaults to the empty string.
    Puppet::Resource::Param(Any, 'subsetting_separator'),

    # The separator string between the subsetting name and its value. Defaults to the empty string.
    Puppet::Resource::Param(Any, 'subsetting_key_val_separator'),

    # The ini file Puppet will ensure contains the specified setting.
    Puppet::Resource::Param(Any, 'path'),

    # Whether to display differences when the setting changes.
    # 
    # Valid values are `true`, `md5`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'md5', 'false']], 'show_diff'),

    # The separator string to use between each setting name and value.
    Puppet::Resource::Param(Any, 'key_val_separator'),

    # The character used to quote the entire value of the setting. Valid values are '', '"' and "'"
    Puppet::Resource::Param(Any, 'quote_char'),

    # Set to true if your subsettings don't have values and you want to use exact matches to determine if the subsetting exists.
    # 
    # Valid values are `true`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false']], 'use_exact_match'),

    # Where the new subsetting item should be inserted
    # 
    # * :start  - insert at the beginning of the line.
    # * :end    - insert at the end of the line (default).
    # * :before - insert before the specified element if possible.
    # * :after  - insert after the specified element if possible.
    # * :index  - insert at the specified index number.
    # 
    # Valid values are `start`, `end`, `before`, `after`, `index`.
    Puppet::Resource::Param(Enum['start', 'end', 'before', 'after', 'index'], 'insert_type'),

    # The value for the insert types which require one.
    Puppet::Resource::Param(Any, 'insert_value'),

    # Set to true to delete the parent setting when the subsetting is empty instead of writing an empty string
    # 
    # Valid values are `true`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false']], 'delete_if_empty'),

    # The specific backend to use for this `ini_subsetting`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # ruby
    # : 
    #   Creates new ini_subsetting file, a specific config file with a provider that uses
    #   this as its parent and implements the method
    #   self.file_path, and that will provide the value for the path to the
    #   ini file.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
