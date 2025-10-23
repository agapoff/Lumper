$VAR1 = {
          'expand' => 'projects',
          'projects' => [
                          {
                            'issuetypes' => [
                                              {
                                                'name' => 'Task',
                                                'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/issuetype/avatar/10318?size=medium',
                                                'untranslatedName' => 'Task',
                                                'hierarchyLevel' => 0,
                                                'self' => 'https://appgateinc.atlassian.net/rest/api/2/issuetype/10005',
                                                'fields' => {
                                                              'customfield_10014' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'schema' => {
                                                                                                     'type' => 'any',
                                                                                                     'customId' => 10014,
                                                                                                     'custom' => 'com.pyxis.greenhopper.jira:gh-epic-link'
                                                                                                   },
                                                                                       'key' => 'customfield_10014',
                                                                                       'hasDefaultValue' => bless( do{\(my $o = 0)}, 'JSON::PP::Boolean' ),
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Epic Link'
                                                                                     },
                                                              'customfield_10950' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'key' => 'customfield_10950',
                                                                                       'schema' => {
                                                                                                     'type' => 'string',
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:url',
                                                                                                     'customId' => 10950
                                                                                                   },
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Craft link'
                                                                                     },
                                                              'customfield_10752' => {
                                                                                       'key' => 'customfield_10752',
                                                                                       'schema' => {
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:datepicker',
                                                                                                     'customId' => 10752,
                                                                                                     'type' => 'date'
                                                                                                   },
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Original Creation Date',
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'reporter' => {
                                                                              'required' => bless( do{\(my $o = 1)}, 'JSON::PP::Boolean' ),
                                                                              'name' => 'Reporter',
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                              'schema' => {
                                                                                            'type' => 'user',
                                                                                            'system' => 'reporter'
                                                                                          },
                                                                              'key' => 'reporter',
                                                                              'autoCompleteUrl' => 'https://appgateinc.atlassian.net/rest/api/2/user/recommend?context=Reporter&issueKey=',
                                                                              'operations' => [
                                                                                                'set'
                                                                                              ]
                                                                            },
                                                              'customfield_10983' => {
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Original estimate',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'schema' => {
                                                                                                     'type' => 'number',
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:float',
                                                                                                     'customId' => 10983
                                                                                                   },
                                                                                       'key' => 'customfield_10983',
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'priority' => {
                                                                              'allowedValues' => [
                                                                                                   {
                                                                                                     'avatarId' => 10674,
                                                                                                     'name' => '500',
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10674?size=medium',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10010',
                                                                                                     'id' => '10010'
                                                                                                   },
                                                                                                   {
                                                                                                     'name' => '400',
                                                                                                     'avatarId' => 10677,
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10677?size=medium',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10011',
                                                                                                     'id' => '10011'
                                                                                                   },
                                                                                                   {
                                                                                                     'name' => '300',
                                                                                                     'avatarId' => 10672,
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10672?size=medium',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10012',
                                                                                                     'id' => '10012'
                                                                                                   },
                                                                                                   {
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10679?size=medium',
                                                                                                     'name' => '200',
                                                                                                     'avatarId' => 10679,
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10013',
                                                                                                     'id' => '10013'
                                                                                                   },
                                                                                                   {
                                                                                                     'name' => '100',
                                                                                                     'avatarId' => 10673,
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10673?size=medium',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10014',
                                                                                                     'id' => '10014'
                                                                                                   }
                                                                                                 ],
                                                                              'name' => 'Priority',
                                                                              'schema' => {
                                                                                            'system' => 'priority',
                                                                                            'type' => 'priority'
                                                                                          },
                                                                              'operations' => [
                                                                                                'set'
                                                                                              ],
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                              'defaultValue' => {
                                                                                                  'avatarId' => 10679,
                                                                                                  'name' => '200',
                                                                                                  'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10679?size=medium',
                                                                                                  'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10013',
                                                                                                  'id' => '10013'
                                                                                                },
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'key' => 'priority'
                                                                            },
                                                              'timetracking' => {
                                                                                  'operations' => [
                                                                                                    'set',
                                                                                                    'edit'
                                                                                                  ],
                                                                                  'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                  'name' => 'Time tracking',
                                                                                  'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                  'key' => 'timetracking',
                                                                                  'schema' => {
                                                                                                'type' => 'timetracking',
                                                                                                'system' => 'timetracking'
                                                                                              }
                                                                                },
                                                              'summary' => {
                                                                             'operations' => [
                                                                                               'set'
                                                                                             ],
                                                                             'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'name' => 'Summary',
                                                                             'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                             'schema' => {
                                                                                           'type' => 'string',
                                                                                           'system' => 'summary'
                                                                                         },
                                                                             'key' => 'summary'
                                                                           },
                                                              'customfield_10020' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'name' => 'Sprint',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'key' => 'customfield_10020',
                                                                                       'schema' => {
                                                                                                     'type' => 'array',
                                                                                                     'items' => 'json',
                                                                                                     'customId' => 10020,
                                                                                                     'custom' => 'com.pyxis.greenhopper.jira:gh-sprint'
                                                                                                   }
                                                                                     },
                                                              'fixVersions' => {
                                                                                 'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'name' => 'Fix versions',
                                                                                 'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'key' => 'fixVersions',
                                                                                 'schema' => {
                                                                                               'system' => 'fixVersions',
                                                                                               'type' => 'array',
                                                                                               'items' => 'version'
                                                                                             },
                                                                                 'operations' => [
                                                                                                   'set',
                                                                                                   'add',
                                                                                                   'remove'
                                                                                                 ],
                                                                                 'allowedValues' => [
                                                                                                      {
                                                                                                        'id' => '13669',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13669',
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'projectId' => 10565,
                                                                                                        'name' => '0.8'
                                                                                                      },
                                                                                                      {
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'name' => '0.7',
                                                                                                        'projectId' => 10565,
                                                                                                        'id' => '13696',
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13696',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                                      },
                                                                                                      {
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13697',
                                                                                                        'id' => '13697',
                                                                                                        'projectId' => 10565,
                                                                                                        'name' => '0.9',
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                                      },
                                                                                                      {
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13698',
                                                                                                        'id' => '13698',
                                                                                                        'projectId' => 10565,
                                                                                                        'name' => '6.6',
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                                      }
                                                                                                    ]
                                                                               },
                                                              'customfield_10720' => {
                                                                                       'key' => 'customfield_10720',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'defaultValue' => {
                                                                                                           'id' => '11253',
                                                                                                           'value' => 'No Team',
                                                                                                           'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11253'
                                                                                                         },
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'schema' => {
                                                                                                     'type' => 'option',
                                                                                                     'customId' => 10720,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:select'
                                                                                                   },
                                                                                       'name' => 'ZTNA Team',
                                                                                       'allowedValues' => [
                                                                                                            {
                                                                                                              'value' => 'No Team',
                                                                                                              'id' => '11253',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11253'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Core',
                                                                                                              'id' => '11254',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11254'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11255',
                                                                                                              'value' => 'Data Plane',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11255'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11256',
                                                                                                              'value' => 'Integrations',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11256'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11257',
                                                                                                              'value' => 'Platform',
                                                                                                              'id' => '11257'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11258',
                                                                                                              'value' => 'UI',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11258'
                                                                                                            }
                                                                                                          ]
                                                                                     },
                                                              'customfield_10028' => {
                                                                                       'schema' => {
                                                                                                     'customId' => 10028,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:float',
                                                                                                     'type' => 'number'
                                                                                                   },
                                                                                       'key' => 'customfield_10028',
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Story Points',
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'customfield_11016' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'key' => 'customfield_11016',
                                                                                       'schema' => {
                                                                                                     'type' => 'string',
                                                                                                     'customId' => 11016,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:textarea'
                                                                                                   },
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Release note'
                                                                                     },
                                                              'assignee' => {
                                                                              'key' => 'assignee',
                                                                              'schema' => {
                                                                                            'system' => 'assignee',
                                                                                            'type' => 'user'
                                                                                          },
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'name' => 'Assignee',
                                                                              'operations' => [
                                                                                                'set'
                                                                                              ],
                                                                              'autoCompleteUrl' => 'https://appgateinc.atlassian.net/rest/api/2/user/assignable/search?project=ZT27&query='
                                                                            },
                                                              'project' => {
                                                                             'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                             'name' => 'Project',
                                                                             'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'schema' => {
                                                                                           'system' => 'project',
                                                                                           'type' => 'project'
                                                                                         },
                                                                             'key' => 'project',
                                                                             'allowedValues' => [
                                                                                                  {
                                                                                                    'name' => 'ZTNA - Test 27',
                                                                                                    'self' => 'https://appgateinc.atlassian.net/rest/api/2/project/10565',
                                                                                                    'simplified' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                    'avatarUrls' => {
                                                                                                                      '16x16' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=xsmall',
                                                                                                                      '48x48' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402',
                                                                                                                      '32x32' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=medium',
                                                                                                                      '24x24' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=small'
                                                                                                                    },
                                                                                                    'projectCategory' => {
                                                                                                                           'id' => '10013',
                                                                                                                           'description' => 'ZTNA Projects',
                                                                                                                           'self' => 'https://appgateinc.atlassian.net/rest/api/2/projectCategory/10013',
                                                                                                                           'name' => 'ZTNA'
                                                                                                                         },
                                                                                                    'projectTypeKey' => 'software',
                                                                                                    'key' => 'ZT27',
                                                                                                    'id' => '10565'
                                                                                                  }
                                                                                                ],
                                                                             'operations' => [
                                                                                               'set'
                                                                                             ]
                                                                           },
                                                              'parent' => {
                                                                            'operations' => [
                                                                                              'set'
                                                                                            ],
                                                                            'key' => 'parent',
                                                                            'schema' => {
                                                                                          'system' => 'parent',
                                                                                          'type' => 'issuelink'
                                                                                        },
                                                                            'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'name' => 'Parent'
                                                                          },
                                                              'duedate' => {
                                                                             'name' => 'Due date',
                                                                             'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'schema' => {
                                                                                           'system' => 'duedate',
                                                                                           'type' => 'date'
                                                                                         },
                                                                             'key' => 'duedate',
                                                                             'operations' => [
                                                                                               'set'
                                                                                             ]
                                                                           },
                                                              'customfield_10851' => {
                                                                                       'name' => 'ZTNA Subsystem',
                                                                                       'schema' => {
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:select',
                                                                                                     'customId' => 10851,
                                                                                                     'type' => 'option'
                                                                                                   },
                                                                                       'allowedValues' => [
                                                                                                            {
                                                                                                              'value' => 'Advisor',
                                                                                                              'id' => '11351',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11351'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11352',
                                                                                                              'id' => '11352',
                                                                                                              'value' => 'Aitorbot'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11353',
                                                                                                              'value' => 'Appliance',
                                                                                                              'id' => '11353'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11354',
                                                                                                              'value' => 'Arc (Container)',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11354'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11355',
                                                                                                              'value' => 'CI/CD',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11355'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Clean Pipe',
                                                                                                              'id' => '11356',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11356'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11357',
                                                                                                              'value' => 'Client',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11357'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Controller',
                                                                                                              'id' => '11478',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11478'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11358',
                                                                                                              'id' => '11358',
                                                                                                              'value' => 'Connector'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11359',
                                                                                                              'id' => '11359',
                                                                                                              'value' => 'DevOps'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11360',
                                                                                                              'value' => 'Envy',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11360'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11361',
                                                                                                              'id' => '11361',
                                                                                                              'value' => 'Frontend'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11362',
                                                                                                              'value' => 'Gateway',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11362'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11363',
                                                                                                              'id' => '11363',
                                                                                                              'value' => 'Helvetest'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11364',
                                                                                                              'value' => 'Injector',
                                                                                                              'id' => '11364'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'LogServer & Forwarder',
                                                                                                              'id' => '11365',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11365'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11366',
                                                                                                              'value' => 'Manual ',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11366'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11367',
                                                                                                              'id' => '11367',
                                                                                                              'value' => 'Metrics'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11368',
                                                                                                              'value' => 'Operator',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11368'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11369',
                                                                                                              'value' => 'Portal',
                                                                                                              'id' => '11369'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11350',
                                                                                                              'value' => 'Other',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11350'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11370',
                                                                                                              'id' => '11370',
                                                                                                              'value' => 'SDK'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11371',
                                                                                                              'value' => 'SDPCTL',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11371'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11372',
                                                                                                              'value' => 'Terraform Provider',
                                                                                                              'id' => '11372'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11477',
                                                                                                              'value' => 'Test',
                                                                                                              'id' => '11477'
                                                                                                            }
                                                                                                          ],
                                                                                       'defaultValue' => {
                                                                                                           'value' => 'Other',
                                                                                                           'id' => '11350',
                                                                                                           'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11350'
                                                                                                         },
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'key' => 'customfield_10851',
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'labels' => {
                                                                            'operations' => [
                                                                                              'add',
                                                                                              'set',
                                                                                              'remove'
                                                                                            ],
                                                                            'autoCompleteUrl' => 'https://appgateinc.atlassian.net/rest/api/1.0/labels/suggest?query=',
                                                                            'schema' => {
                                                                                          'system' => 'labels',
                                                                                          'type' => 'array',
                                                                                          'items' => 'string'
                                                                                        },
                                                                            'key' => 'labels',
                                                                            'name' => 'Labels',
                                                                            'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                          },
                                                              'issuetype' => {
                                                                               'schema' => {
                                                                                             'system' => 'issuetype',
                                                                                             'type' => 'issuetype'
                                                                                           },
                                                                               'key' => 'issuetype',
                                                                               'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                               'name' => 'Issue Type',
                                                                               'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                               'operations' => [],
                                                                               'allowedValues' => [
                                                                                                    {
                                                                                                      'subtask' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                      'id' => '10005',
                                                                                                      'description' => 'A small, distinct piece of work.',
                                                                                                      'hierarchyLevel' => 0,
                                                                                                      'self' => 'https://appgateinc.atlassian.net/rest/api/2/issuetype/10005',
                                                                                                      'name' => 'Task',
                                                                                                      'avatarId' => 10318,
                                                                                                      'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/issuetype/avatar/10318?size=medium'
                                                                                                    }
                                                                                                  ]
                                                                             },
                                                              'versions' => {
                                                                              'allowedValues' => [
                                                                                                   {
                                                                                                     'id' => '13669',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13669',
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'projectId' => 10565,
                                                                                                     'name' => '0.8'
                                                                                                   },
                                                                                                   {
                                                                                                     'name' => '0.7',
                                                                                                     'projectId' => 10565,
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13696',
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'id' => '13696'
                                                                                                   },
                                                                                                   {
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13697',
                                                                                                     'id' => '13697',
                                                                                                     'name' => '0.9',
                                                                                                     'projectId' => 10565,
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                                   },
                                                                                                   {
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'name' => '6.6',
                                                                                                     'projectId' => 10565,
                                                                                                     'id' => '13698',
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13698'
                                                                                                   }
                                                                                                 ],
                                                                              'operations' => [
                                                                                                'set',
                                                                                                'add',
                                                                                                'remove'
                                                                                              ],
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'name' => 'Affects versions',
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'schema' => {
                                                                                            'system' => 'versions',
                                                                                            'type' => 'array',
                                                                                            'items' => 'version'
                                                                                          },
                                                                              'key' => 'versions'
                                                                            },
                                                              'customfield_10818' => {
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'defaultValue' => [
                                                                                                           {
                                                                                                             'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11349',
                                                                                                             'id' => '11349',
                                                                                                             'value' => 'Not reviewed'
                                                                                                           }
                                                                                                         ],
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'key' => 'customfield_10818',
                                                                                       'operations' => [
                                                                                                         'add',
                                                                                                         'set',
                                                                                                         'remove'
                                                                                                       ],
                                                                                       'name' => 'ZTNA Impact',
                                                                                       'schema' => {
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:multiselect',
                                                                                                     'customId' => 10818,
                                                                                                     'items' => 'option',
                                                                                                     'type' => 'array'
                                                                                                   },
                                                                                       'allowedValues' => [
                                                                                                            {
                                                                                                              'id' => '11345',
                                                                                                              'value' => 'No Impact',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11345'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Docs Needs Update',
                                                                                                              'id' => '11346',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11346'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11347',
                                                                                                              'value' => 'Release Notes Needs Update',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11347'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11348',
                                                                                                              'value' => 'VPAT Needs Update',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11348'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11349',
                                                                                                              'id' => '11349',
                                                                                                              'value' => 'Not reviewed'
                                                                                                            }
                                                                                                          ]
                                                                                     },
                                                              'attachment' => {
                                                                                'operations' => [
                                                                                                  'set',
                                                                                                  'copy'
                                                                                                ],
                                                                                'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'name' => 'Attachment',
                                                                                'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'schema' => {
                                                                                              'items' => 'attachment',
                                                                                              'type' => 'array',
                                                                                              'system' => 'attachment'
                                                                                            },
                                                                                'key' => 'attachment'
                                                                              },
                                                              'description' => {
                                                                                 'operations' => [
                                                                                                   'set'
                                                                                                 ],
                                                                                 'key' => 'description',
                                                                                 'schema' => {
                                                                                               'system' => 'description',
                                                                                               'type' => 'string'
                                                                                             },
                                                                                 'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'name' => 'Description'
                                                                               },
                                                              'components' => {
                                                                                'allowedValues' => [],
                                                                                'operations' => [
                                                                                                  'add',
                                                                                                  'set',
                                                                                                  'remove'
                                                                                                ],
                                                                                'schema' => {
                                                                                              'system' => 'components',
                                                                                              'type' => 'array',
                                                                                              'items' => 'component'
                                                                                            },
                                                                                'key' => 'components',
                                                                                'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'name' => 'Components',
                                                                                'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                              }
                                                            },
                                                'expand' => 'fields',
                                                'subtask' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                'id' => '10005',
                                                'description' => 'A small, distinct piece of work.'
                                              },
                                              {
                                                'description' => 'Functionality or a feature expressed as a user goal.',
                                                'id' => '10004',
                                                'subtask' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                'expand' => 'fields',
                                                'fields' => {
                                                              'labels' => {
                                                                            'operations' => [
                                                                                              'add',
                                                                                              'set',
                                                                                              'remove'
                                                                                            ],
                                                                            'autoCompleteUrl' => 'https://appgateinc.atlassian.net/rest/api/1.0/labels/suggest?query=',
                                                                            'schema' => {
                                                                                          'system' => 'labels',
                                                                                          'items' => 'string',
                                                                                          'type' => 'array'
                                                                                        },
                                                                            'key' => 'labels',
                                                                            'name' => 'Labels',
                                                                            'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                          },
                                                              'customfield_10851' => {
                                                                                       'schema' => {
                                                                                                     'type' => 'option',
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:select',
                                                                                                     'customId' => 10851
                                                                                                   },
                                                                                       'name' => 'ZTNA Subsystem',
                                                                                       'allowedValues' => [
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11351',
                                                                                                              'id' => '11351',
                                                                                                              'value' => 'Advisor'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11352',
                                                                                                              'value' => 'Aitorbot',
                                                                                                              'id' => '11352'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Appliance',
                                                                                                              'id' => '11353',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11353'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Arc (Container)',
                                                                                                              'id' => '11354',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11354'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11355',
                                                                                                              'value' => 'CI/CD',
                                                                                                              'id' => '11355'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11356',
                                                                                                              'value' => 'Clean Pipe',
                                                                                                              'id' => '11356'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11357',
                                                                                                              'id' => '11357',
                                                                                                              'value' => 'Client'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11478',
                                                                                                              'value' => 'Controller',
                                                                                                              'id' => '11478'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11358',
                                                                                                              'id' => '11358',
                                                                                                              'value' => 'Connector'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11359',
                                                                                                              'value' => 'DevOps',
                                                                                                              'id' => '11359'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11360',
                                                                                                              'value' => 'Envy',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11360'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Frontend',
                                                                                                              'id' => '11361',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11361'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11362',
                                                                                                              'id' => '11362',
                                                                                                              'value' => 'Gateway'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11363',
                                                                                                              'value' => 'Helvetest',
                                                                                                              'id' => '11363'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11364',
                                                                                                              'value' => 'Injector',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11364'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11365',
                                                                                                              'value' => 'LogServer & Forwarder',
                                                                                                              'id' => '11365'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Manual ',
                                                                                                              'id' => '11366',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11366'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11367',
                                                                                                              'id' => '11367',
                                                                                                              'value' => 'Metrics'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11368',
                                                                                                              'value' => 'Operator',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11368'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11369',
                                                                                                              'value' => 'Portal',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11369'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11350',
                                                                                                              'value' => 'Other',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11350'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'SDK',
                                                                                                              'id' => '11370',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11370'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'SDPCTL',
                                                                                                              'id' => '11371',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11371'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11372',
                                                                                                              'id' => '11372',
                                                                                                              'value' => 'Terraform Provider'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11477',
                                                                                                              'value' => 'Test',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11477'
                                                                                                            }
                                                                                                          ],
                                                                                       'key' => 'customfield_10851',
                                                                                       'defaultValue' => {
                                                                                                           'value' => 'Other',
                                                                                                           'id' => '11350',
                                                                                                           'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11350'
                                                                                                         },
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'issuetype' => {
                                                                               'operations' => [],
                                                                               'allowedValues' => [
                                                                                                    {
                                                                                                      'subtask' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                      'id' => '10004',
                                                                                                      'description' => 'Functionality or a feature expressed as a user goal.',
                                                                                                      'hierarchyLevel' => 0,
                                                                                                      'self' => 'https://appgateinc.atlassian.net/rest/api/2/issuetype/10004',
                                                                                                      'avatarId' => 10315,
                                                                                                      'name' => 'Story',
                                                                                                      'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/issuetype/avatar/10315?size=medium'
                                                                                                    }
                                                                                                  ],
                                                                               'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                               'name' => 'Issue Type',
                                                                               'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                               'key' => 'issuetype',
                                                                               'schema' => {
                                                                                             'system' => 'issuetype',
                                                                                             'type' => 'issuetype'
                                                                                           }
                                                                             },
                                                              'versions' => {
                                                                              'allowedValues' => [
                                                                                                   {
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13669',
                                                                                                     'id' => '13669',
                                                                                                     'projectId' => 10565,
                                                                                                     'name' => '0.8',
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                                   },
                                                                                                   {
                                                                                                     'projectId' => 10565,
                                                                                                     'name' => '0.7',
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13696',
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'id' => '13696'
                                                                                                   },
                                                                                                   {
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13697',
                                                                                                     'id' => '13697',
                                                                                                     'name' => '0.9',
                                                                                                     'projectId' => 10565,
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                                   },
                                                                                                   {
                                                                                                     'id' => '13698',
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13698',
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'projectId' => 10565,
                                                                                                     'name' => '6.6'
                                                                                                   }
                                                                                                 ],
                                                                              'operations' => [
                                                                                                'set',
                                                                                                'add',
                                                                                                'remove'
                                                                                              ],
                                                                              'key' => 'versions',
                                                                              'schema' => {
                                                                                            'type' => 'array',
                                                                                            'items' => 'version',
                                                                                            'system' => 'versions'
                                                                                          },
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'name' => 'Affects versions',
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                            },
                                                              'components' => {
                                                                                'schema' => {
                                                                                              'system' => 'components',
                                                                                              'type' => 'array',
                                                                                              'items' => 'component'
                                                                                            },
                                                                                'key' => 'components',
                                                                                'name' => 'Components',
                                                                                'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'allowedValues' => [],
                                                                                'operations' => [
                                                                                                  'add',
                                                                                                  'set',
                                                                                                  'remove'
                                                                                                ]
                                                                              },
                                                              'description' => {
                                                                                 'operations' => [
                                                                                                   'set'
                                                                                                 ],
                                                                                 'schema' => {
                                                                                               'type' => 'string',
                                                                                               'system' => 'description'
                                                                                             },
                                                                                 'key' => 'description',
                                                                                 'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'name' => 'Description',
                                                                                 'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                               },
                                                              'attachment' => {
                                                                                'operations' => [
                                                                                                  'set',
                                                                                                  'copy'
                                                                                                ],
                                                                                'schema' => {
                                                                                              'items' => 'attachment',
                                                                                              'type' => 'array',
                                                                                              'system' => 'attachment'
                                                                                            },
                                                                                'key' => 'attachment',
                                                                                'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'name' => 'Attachment',
                                                                                'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                              },
                                                              'customfield_10818' => {
                                                                                       'schema' => {
                                                                                                     'type' => 'array',
                                                                                                     'items' => 'option',
                                                                                                     'customId' => 10818,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:multiselect'
                                                                                                   },
                                                                                       'name' => 'ZTNA Impact',
                                                                                       'allowedValues' => [
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11345',
                                                                                                              'id' => '11345',
                                                                                                              'value' => 'No Impact'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Docs Needs Update',
                                                                                                              'id' => '11346',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11346'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11347',
                                                                                                              'id' => '11347',
                                                                                                              'value' => 'Release Notes Needs Update'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11348',
                                                                                                              'value' => 'VPAT Needs Update',
                                                                                                              'id' => '11348'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Not reviewed',
                                                                                                              'id' => '11349',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11349'
                                                                                                            }
                                                                                                          ],
                                                                                       'key' => 'customfield_10818',
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'defaultValue' => [
                                                                                                           {
                                                                                                             'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11349',
                                                                                                             'id' => '11349',
                                                                                                             'value' => 'Not reviewed'
                                                                                                           }
                                                                                                         ],
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'operations' => [
                                                                                                         'add',
                                                                                                         'set',
                                                                                                         'remove'
                                                                                                       ]
                                                                                     },
                                                              'assignee' => {
                                                                              'schema' => {
                                                                                            'system' => 'assignee',
                                                                                            'type' => 'user'
                                                                                          },
                                                                              'key' => 'assignee',
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'name' => 'Assignee',
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'operations' => [
                                                                                                'set'
                                                                                              ],
                                                                              'autoCompleteUrl' => 'https://appgateinc.atlassian.net/rest/api/2/user/assignable/search?project=ZT27&query='
                                                                            },
                                                              'customfield_11016' => {
                                                                                       'schema' => {
                                                                                                     'type' => 'string',
                                                                                                     'customId' => 11016,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:textarea'
                                                                                                   },
                                                                                       'key' => 'customfield_11016',
                                                                                       'name' => 'Release note',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'customfield_10028' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Story Points',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'schema' => {
                                                                                                     'type' => 'number',
                                                                                                     'customId' => 10028,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:float'
                                                                                                   },
                                                                                       'key' => 'customfield_10028'
                                                                                     },
                                                              'project' => {
                                                                             'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'name' => 'Project',
                                                                             'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                             'key' => 'project',
                                                                             'schema' => {
                                                                                           'type' => 'project',
                                                                                           'system' => 'project'
                                                                                         },
                                                                             'operations' => [
                                                                                               'set'
                                                                                             ],
                                                                             'allowedValues' => [
                                                                                                  {
                                                                                                    'self' => 'https://appgateinc.atlassian.net/rest/api/2/project/10565',
                                                                                                    'avatarUrls' => {
                                                                                                                      '16x16' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=xsmall',
                                                                                                                      '48x48' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402',
                                                                                                                      '24x24' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=small',
                                                                                                                      '32x32' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=medium'
                                                                                                                    },
                                                                                                    'simplified' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                    'name' => 'ZTNA - Test 27',
                                                                                                    'id' => '10565',
                                                                                                    'projectTypeKey' => 'software',
                                                                                                    'projectCategory' => {
                                                                                                                           'name' => 'ZTNA',
                                                                                                                           'description' => 'ZTNA Projects',
                                                                                                                           'self' => 'https://appgateinc.atlassian.net/rest/api/2/projectCategory/10013',
                                                                                                                           'id' => '10013'
                                                                                                                         },
                                                                                                    'key' => 'ZT27'
                                                                                                  }
                                                                                                ]
                                                                           },
                                                              'duedate' => {
                                                                             'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'name' => 'Due date',
                                                                             'key' => 'duedate',
                                                                             'schema' => {
                                                                                           'type' => 'date',
                                                                                           'system' => 'duedate'
                                                                                         },
                                                                             'operations' => [
                                                                                               'set'
                                                                                             ]
                                                                           },
                                                              'parent' => {
                                                                            'operations' => [
                                                                                              'set'
                                                                                            ],
                                                                            'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'name' => 'Parent',
                                                                            'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'key' => 'parent',
                                                                            'schema' => {
                                                                                          'system' => 'parent',
                                                                                          'type' => 'issuelink'
                                                                                        }
                                                                          },
                                                              'customfield_10983' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'schema' => {
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:float',
                                                                                                     'customId' => 10983,
                                                                                                     'type' => 'number'
                                                                                                   },
                                                                                       'key' => 'customfield_10983',
                                                                                       'name' => 'Original estimate',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                     },
                                                              'priority' => {
                                                                              'allowedValues' => [
                                                                                                   {
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10010',
                                                                                                     'id' => '10010',
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10674?size=medium',
                                                                                                     'avatarId' => 10674,
                                                                                                     'name' => '500'
                                                                                                   },
                                                                                                   {
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10011',
                                                                                                     'id' => '10011',
                                                                                                     'avatarId' => 10677,
                                                                                                     'name' => '400',
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10677?size=medium'
                                                                                                   },
                                                                                                   {
                                                                                                     'id' => '10012',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10012',
                                                                                                     'avatarId' => 10672,
                                                                                                     'name' => '300',
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10672?size=medium'
                                                                                                   },
                                                                                                   {
                                                                                                     'id' => '10013',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10013',
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10679?size=medium',
                                                                                                     'avatarId' => 10679,
                                                                                                     'name' => '200'
                                                                                                   },
                                                                                                   {
                                                                                                     'id' => '10014',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10014',
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10673?size=medium',
                                                                                                     'name' => '100',
                                                                                                     'avatarId' => 10673
                                                                                                   }
                                                                                                 ],
                                                                              'name' => 'Priority',
                                                                              'schema' => {
                                                                                            'system' => 'priority',
                                                                                            'type' => 'priority'
                                                                                          },
                                                                              'operations' => [
                                                                                                'set'
                                                                                              ],
                                                                              'defaultValue' => {
                                                                                                  'id' => '10013',
                                                                                                  'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10013',
                                                                                                  'name' => '200',
                                                                                                  'avatarId' => 10679,
                                                                                                  'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10679?size=medium'
                                                                                                },
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'key' => 'priority'
                                                                            },
                                                              'customfield_10020' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'name' => 'Sprint',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'key' => 'customfield_10020',
                                                                                       'schema' => {
                                                                                                     'type' => 'array',
                                                                                                     'items' => 'json',
                                                                                                     'customId' => 10020,
                                                                                                     'custom' => 'com.pyxis.greenhopper.jira:gh-sprint'
                                                                                                   }
                                                                                     },
                                                              'summary' => {
                                                                             'key' => 'summary',
                                                                             'schema' => {
                                                                                           'type' => 'string',
                                                                                           'system' => 'summary'
                                                                                         },
                                                                             'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'name' => 'Summary',
                                                                             'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                             'operations' => [
                                                                                               'set'
                                                                                             ]
                                                                           },
                                                              'timetracking' => {
                                                                                  'schema' => {
                                                                                                'type' => 'timetracking',
                                                                                                'system' => 'timetracking'
                                                                                              },
                                                                                  'key' => 'timetracking',
                                                                                  'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                  'name' => 'Time tracking',
                                                                                  'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                  'operations' => [
                                                                                                    'set',
                                                                                                    'edit'
                                                                                                  ]
                                                                                },
                                                              'customfield_10720' => {
                                                                                       'allowedValues' => [
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11253',
                                                                                                              'value' => 'No Team',
                                                                                                              'id' => '11253'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11254',
                                                                                                              'value' => 'Core',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11254'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11255',
                                                                                                              'value' => 'Data Plane',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11255'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11256',
                                                                                                              'id' => '11256',
                                                                                                              'value' => 'Integrations'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11257',
                                                                                                              'id' => '11257',
                                                                                                              'value' => 'Platform'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'UI',
                                                                                                              'id' => '11258',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11258'
                                                                                                            }
                                                                                                          ],
                                                                                       'schema' => {
                                                                                                     'type' => 'option',
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:select',
                                                                                                     'customId' => 10720
                                                                                                   },
                                                                                       'name' => 'ZTNA Team',
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'key' => 'customfield_10720',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'defaultValue' => {
                                                                                                           'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11253',
                                                                                                           'value' => 'No Team',
                                                                                                           'id' => '11253'
                                                                                                         }
                                                                                     },
                                                              'fixVersions' => {
                                                                                 'key' => 'fixVersions',
                                                                                 'schema' => {
                                                                                               'system' => 'fixVersions',
                                                                                               'items' => 'version',
                                                                                               'type' => 'array'
                                                                                             },
                                                                                 'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'name' => 'Fix versions',
                                                                                 'operations' => [
                                                                                                   'set',
                                                                                                   'add',
                                                                                                   'remove'
                                                                                                 ],
                                                                                 'allowedValues' => [
                                                                                                      {
                                                                                                        'id' => '13669',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13669',
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'name' => '0.8',
                                                                                                        'projectId' => 10565
                                                                                                      },
                                                                                                      {
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'projectId' => 10565,
                                                                                                        'name' => '0.7',
                                                                                                        'id' => '13696',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13696'
                                                                                                      },
                                                                                                      {
                                                                                                        'projectId' => 10565,
                                                                                                        'name' => '0.9',
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13697',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'id' => '13697'
                                                                                                      },
                                                                                                      {
                                                                                                        'name' => '6.6',
                                                                                                        'projectId' => 10565,
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13698',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'id' => '13698'
                                                                                                      }
                                                                                                    ]
                                                                               },
                                                              'customfield_10014' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Epic Link',
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'key' => 'customfield_10014',
                                                                                       'schema' => {
                                                                                                     'custom' => 'com.pyxis.greenhopper.jira:gh-epic-link',
                                                                                                     'customId' => 10014,
                                                                                                     'type' => 'any'
                                                                                                   }
                                                                                     },
                                                              'customfield_10950' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Craft link',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'schema' => {
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:url',
                                                                                                     'customId' => 10950,
                                                                                                     'type' => 'string'
                                                                                                   },
                                                                                       'key' => 'customfield_10950'
                                                                                     },
                                                              'reporter' => {
                                                                              'key' => 'reporter',
                                                                              'schema' => {
                                                                                            'system' => 'reporter',
                                                                                            'type' => 'user'
                                                                                          },
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                              'name' => 'Reporter',
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                              'operations' => [
                                                                                                'set'
                                                                                              ],
                                                                              'autoCompleteUrl' => 'https://appgateinc.atlassian.net/rest/api/2/user/recommend?context=Reporter&issueKey='
                                                                            },
                                                              'customfield_10752' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'key' => 'customfield_10752',
                                                                                       'schema' => {
                                                                                                     'customId' => 10752,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:datepicker',
                                                                                                     'type' => 'date'
                                                                                                   },
                                                                                       'name' => 'Original Creation Date',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                     }
                                                            },
                                                'self' => 'https://appgateinc.atlassian.net/rest/api/2/issuetype/10004',
                                                'hierarchyLevel' => 0,
                                                'untranslatedName' => 'Story',
                                                'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/issuetype/avatar/10315?size=medium',
                                                'name' => 'Story'
                                              },
                                              {
                                                'fields' => {
                                                              'duedate' => {
                                                                             'key' => 'duedate',
                                                                             'schema' => {
                                                                                           'type' => 'date',
                                                                                           'system' => 'duedate'
                                                                                         },
                                                                             'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'name' => 'Due date',
                                                                             'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'operations' => [
                                                                                               'set'
                                                                                             ]
                                                                           },
                                                              'parent' => {
                                                                            'operations' => [
                                                                                              'set'
                                                                                            ],
                                                                            'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'name' => 'Parent',
                                                                            'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'schema' => {
                                                                                          'type' => 'issuelink',
                                                                                          'system' => 'parent'
                                                                                        },
                                                                            'key' => 'parent'
                                                                          },
                                                              'project' => {
                                                                             'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                             'name' => 'Project',
                                                                             'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'key' => 'project',
                                                                             'schema' => {
                                                                                           'system' => 'project',
                                                                                           'type' => 'project'
                                                                                         },
                                                                             'allowedValues' => [
                                                                                                  {
                                                                                                    'name' => 'ZTNA - Test 27',
                                                                                                    'self' => 'https://appgateinc.atlassian.net/rest/api/2/project/10565',
                                                                                                    'avatarUrls' => {
                                                                                                                      '32x32' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=medium',
                                                                                                                      '24x24' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=small',
                                                                                                                      '48x48' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402',
                                                                                                                      '16x16' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=xsmall'
                                                                                                                    },
                                                                                                    'simplified' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                    'projectCategory' => {
                                                                                                                           'description' => 'ZTNA Projects',
                                                                                                                           'self' => 'https://appgateinc.atlassian.net/rest/api/2/projectCategory/10013',
                                                                                                                           'id' => '10013',
                                                                                                                           'name' => 'ZTNA'
                                                                                                                         },
                                                                                                    'projectTypeKey' => 'software',
                                                                                                    'key' => 'ZT27',
                                                                                                    'id' => '10565'
                                                                                                  }
                                                                                                ],
                                                                             'operations' => [
                                                                                               'set'
                                                                                             ]
                                                                           },
                                                              'customfield_11016' => {
                                                                                       'key' => 'customfield_11016',
                                                                                       'schema' => {
                                                                                                     'type' => 'string',
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:textarea',
                                                                                                     'customId' => 11016
                                                                                                   },
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Release note',
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'assignee' => {
                                                                              'autoCompleteUrl' => 'https://appgateinc.atlassian.net/rest/api/2/user/assignable/search?project=ZT27&query=',
                                                                              'operations' => [
                                                                                                'set'
                                                                                              ],
                                                                              'name' => 'Assignee',
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'key' => 'assignee',
                                                                              'schema' => {
                                                                                            'type' => 'user',
                                                                                            'system' => 'assignee'
                                                                                          }
                                                                            },
                                                              'customfield_10028' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'schema' => {
                                                                                                     'customId' => 10028,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:float',
                                                                                                     'type' => 'number'
                                                                                                   },
                                                                                       'key' => 'customfield_10028',
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Story Points',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                     },
                                                              'components' => {
                                                                                'operations' => [
                                                                                                  'add',
                                                                                                  'set',
                                                                                                  'remove'
                                                                                                ],
                                                                                'allowedValues' => [],
                                                                                'schema' => {
                                                                                              'system' => 'components',
                                                                                              'type' => 'array',
                                                                                              'items' => 'component'
                                                                                            },
                                                                                'key' => 'components',
                                                                                'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'name' => 'Components'
                                                                              },
                                                              'customfield_10818' => {
                                                                                       'key' => 'customfield_10818',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'defaultValue' => [
                                                                                                           {
                                                                                                             'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11349',
                                                                                                             'id' => '11349',
                                                                                                             'value' => 'Not reviewed'
                                                                                                           }
                                                                                                         ],
                                                                                       'operations' => [
                                                                                                         'add',
                                                                                                         'set',
                                                                                                         'remove'
                                                                                                       ],
                                                                                       'schema' => {
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:multiselect',
                                                                                                     'customId' => 10818,
                                                                                                     'items' => 'option',
                                                                                                     'type' => 'array'
                                                                                                   },
                                                                                       'name' => 'ZTNA Impact',
                                                                                       'allowedValues' => [
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11345',
                                                                                                              'id' => '11345',
                                                                                                              'value' => 'No Impact'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11346',
                                                                                                              'value' => 'Docs Needs Update',
                                                                                                              'id' => '11346'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11347',
                                                                                                              'value' => 'Release Notes Needs Update',
                                                                                                              'id' => '11347'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11348',
                                                                                                              'id' => '11348',
                                                                                                              'value' => 'VPAT Needs Update'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11349',
                                                                                                              'value' => 'Not reviewed',
                                                                                                              'id' => '11349'
                                                                                                            }
                                                                                                          ]
                                                                                     },
                                                              'description' => {
                                                                                 'name' => 'Description',
                                                                                 'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'schema' => {
                                                                                               'system' => 'description',
                                                                                               'type' => 'string'
                                                                                             },
                                                                                 'key' => 'description',
                                                                                 'operations' => [
                                                                                                   'set'
                                                                                                 ]
                                                                               },
                                                              'attachment' => {
                                                                                'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'name' => 'Attachment',
                                                                                'key' => 'attachment',
                                                                                'schema' => {
                                                                                              'type' => 'array',
                                                                                              'items' => 'attachment',
                                                                                              'system' => 'attachment'
                                                                                            },
                                                                                'operations' => [
                                                                                                  'set',
                                                                                                  'copy'
                                                                                                ]
                                                                              },
                                                              'versions' => {
                                                                              'name' => 'Affects versions',
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'schema' => {
                                                                                            'items' => 'version',
                                                                                            'type' => 'array',
                                                                                            'system' => 'versions'
                                                                                          },
                                                                              'key' => 'versions',
                                                                              'allowedValues' => [
                                                                                                   {
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13669',
                                                                                                     'id' => '13669',
                                                                                                     'name' => '0.8',
                                                                                                     'projectId' => 10565,
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                                   },
                                                                                                   {
                                                                                                     'projectId' => 10565,
                                                                                                     'name' => '0.7',
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13696',
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'id' => '13696'
                                                                                                   },
                                                                                                   {
                                                                                                     'projectId' => 10565,
                                                                                                     'name' => '0.9',
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13697',
                                                                                                     'id' => '13697'
                                                                                                   },
                                                                                                   {
                                                                                                     'projectId' => 10565,
                                                                                                     'name' => '6.6',
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13698',
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'id' => '13698'
                                                                                                   }
                                                                                                 ],
                                                                              'operations' => [
                                                                                                'set',
                                                                                                'add',
                                                                                                'remove'
                                                                                              ]
                                                                            },
                                                              'issuetype' => {
                                                                               'operations' => [],
                                                                               'allowedValues' => [
                                                                                                    {
                                                                                                      'self' => 'https://appgateinc.atlassian.net/rest/api/2/issuetype/10007',
                                                                                                      'hierarchyLevel' => 0,
                                                                                                      'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/issuetype/avatar/10572?size=medium',
                                                                                                      'name' => 'Bug',
                                                                                                      'avatarId' => 10572,
                                                                                                      'description' => 'A problem or error.',
                                                                                                      'id' => '10007',
                                                                                                      'subtask' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                                    }
                                                                                                  ],
                                                                               'key' => 'issuetype',
                                                                               'schema' => {
                                                                                             'system' => 'issuetype',
                                                                                             'type' => 'issuetype'
                                                                                           },
                                                                               'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                               'name' => 'Issue Type',
                                                                               'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'}
                                                                             },
                                                              'customfield_10851' => {
                                                                                       'schema' => {
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:select',
                                                                                                     'customId' => 10851,
                                                                                                     'type' => 'option'
                                                                                                   },
                                                                                       'name' => 'ZTNA Subsystem',
                                                                                       'allowedValues' => [
                                                                                                            {
                                                                                                              'value' => 'Advisor',
                                                                                                              'id' => '11351',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11351'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11352',
                                                                                                              'value' => 'Aitorbot',
                                                                                                              'id' => '11352'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11353',
                                                                                                              'value' => 'Appliance',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11353'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Arc (Container)',
                                                                                                              'id' => '11354',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11354'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'CI/CD',
                                                                                                              'id' => '11355',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11355'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11356',
                                                                                                              'id' => '11356',
                                                                                                              'value' => 'Clean Pipe'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Client',
                                                                                                              'id' => '11357',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11357'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Controller',
                                                                                                              'id' => '11478',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11478'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11358',
                                                                                                              'id' => '11358',
                                                                                                              'value' => 'Connector'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11359',
                                                                                                              'value' => 'DevOps',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11359'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11360',
                                                                                                              'value' => 'Envy',
                                                                                                              'id' => '11360'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Frontend',
                                                                                                              'id' => '11361',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11361'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11362',
                                                                                                              'value' => 'Gateway',
                                                                                                              'id' => '11362'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11363',
                                                                                                              'value' => 'Helvetest',
                                                                                                              'id' => '11363'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Injector',
                                                                                                              'id' => '11364',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11364'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'LogServer & Forwarder',
                                                                                                              'id' => '11365',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11365'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11366',
                                                                                                              'value' => 'Manual ',
                                                                                                              'id' => '11366'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11367',
                                                                                                              'value' => 'Metrics',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11367'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11368',
                                                                                                              'id' => '11368',
                                                                                                              'value' => 'Operator'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11369',
                                                                                                              'value' => 'Portal',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11369'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11350',
                                                                                                              'value' => 'Other',
                                                                                                              'id' => '11350'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'SDK',
                                                                                                              'id' => '11370',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11370'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11371',
                                                                                                              'id' => '11371',
                                                                                                              'value' => 'SDPCTL'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11372',
                                                                                                              'value' => 'Terraform Provider',
                                                                                                              'id' => '11372'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11477',
                                                                                                              'value' => 'Test',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11477'
                                                                                                            }
                                                                                                          ],
                                                                                       'key' => 'customfield_10851',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'defaultValue' => {
                                                                                                           'value' => 'Other',
                                                                                                           'id' => '11350',
                                                                                                           'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11350'
                                                                                                         },
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'labels' => {
                                                                            'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'name' => 'Labels',
                                                                            'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'key' => 'labels',
                                                                            'schema' => {
                                                                                          'type' => 'array',
                                                                                          'items' => 'string',
                                                                                          'system' => 'labels'
                                                                                        },
                                                                            'autoCompleteUrl' => 'https://appgateinc.atlassian.net/rest/api/1.0/labels/suggest?query=',
                                                                            'operations' => [
                                                                                              'add',
                                                                                              'set',
                                                                                              'remove'
                                                                                            ]
                                                                          },
                                                              'customfield_10752' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Original Creation Date',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'key' => 'customfield_10752',
                                                                                       'schema' => {
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:datepicker',
                                                                                                     'customId' => 10752,
                                                                                                     'type' => 'date'
                                                                                                   }
                                                                                     },
                                                              'reporter' => {
                                                                              'autoCompleteUrl' => 'https://appgateinc.atlassian.net/rest/api/2/user/recommend?context=Reporter&issueKey=',
                                                                              'operations' => [
                                                                                                'set'
                                                                                              ],
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                              'name' => 'Reporter',
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                              'key' => 'reporter',
                                                                              'schema' => {
                                                                                            'type' => 'user',
                                                                                            'system' => 'reporter'
                                                                                          }
                                                                            },
                                                              'customfield_10950' => {
                                                                                       'schema' => {
                                                                                                     'type' => 'string',
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:url',
                                                                                                     'customId' => 10950
                                                                                                   },
                                                                                       'key' => 'customfield_10950',
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Craft link',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'customfield_10014' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'schema' => {
                                                                                                     'type' => 'any',
                                                                                                     'customId' => 10014,
                                                                                                     'custom' => 'com.pyxis.greenhopper.jira:gh-epic-link'
                                                                                                   },
                                                                                       'key' => 'customfield_10014',
                                                                                       'name' => 'Epic Link',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                     },
                                                              'fixVersions' => {
                                                                                 'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'name' => 'Fix versions',
                                                                                 'key' => 'fixVersions',
                                                                                 'schema' => {
                                                                                               'system' => 'fixVersions',
                                                                                               'items' => 'version',
                                                                                               'type' => 'array'
                                                                                             },
                                                                                 'operations' => [
                                                                                                   'set',
                                                                                                   'add',
                                                                                                   'remove'
                                                                                                 ],
                                                                                 'allowedValues' => [
                                                                                                      {
                                                                                                        'name' => '0.8',
                                                                                                        'projectId' => 10565,
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13669',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'id' => '13669'
                                                                                                      },
                                                                                                      {
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'name' => '0.7',
                                                                                                        'projectId' => 10565,
                                                                                                        'id' => '13696',
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13696',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                                      },
                                                                                                      {
                                                                                                        'name' => '0.9',
                                                                                                        'projectId' => 10565,
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13697',
                                                                                                        'id' => '13697'
                                                                                                      },
                                                                                                      {
                                                                                                        'projectId' => 10565,
                                                                                                        'name' => '6.6',
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13698',
                                                                                                        'id' => '13698'
                                                                                                      }
                                                                                                    ]
                                                                               },
                                                              'customfield_10720' => {
                                                                                       'schema' => {
                                                                                                     'customId' => 10720,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:select',
                                                                                                     'type' => 'option'
                                                                                                   },
                                                                                       'name' => 'ZTNA Team',
                                                                                       'allowedValues' => [
                                                                                                            {
                                                                                                              'value' => 'No Team',
                                                                                                              'id' => '11253',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11253'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11254',
                                                                                                              'value' => 'Core',
                                                                                                              'id' => '11254'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11255',
                                                                                                              'value' => 'Data Plane',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11255'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11256',
                                                                                                              'value' => 'Integrations',
                                                                                                              'id' => '11256'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11257',
                                                                                                              'id' => '11257',
                                                                                                              'value' => 'Platform'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11258',
                                                                                                              'value' => 'UI',
                                                                                                              'id' => '11258'
                                                                                                            }
                                                                                                          ],
                                                                                       'key' => 'customfield_10720',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'defaultValue' => {
                                                                                                           'value' => 'No Team',
                                                                                                           'id' => '11253',
                                                                                                           'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11253'
                                                                                                         },
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'summary' => {
                                                                             'operations' => [
                                                                                               'set'
                                                                                             ],
                                                                             'key' => 'summary',
                                                                             'schema' => {
                                                                                           'type' => 'string',
                                                                                           'system' => 'summary'
                                                                                         },
                                                                             'name' => 'Summary',
                                                                             'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                             'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                           },
                                                              'timetracking' => {
                                                                                  'operations' => [
                                                                                                    'set',
                                                                                                    'edit'
                                                                                                  ],
                                                                                  'schema' => {
                                                                                                'type' => 'timetracking',
                                                                                                'system' => 'timetracking'
                                                                                              },
                                                                                  'key' => 'timetracking',
                                                                                  'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                  'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                  'name' => 'Time tracking'
                                                                                },
                                                              'customfield_10020' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'name' => 'Sprint',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'key' => 'customfield_10020',
                                                                                       'schema' => {
                                                                                                     'custom' => 'com.pyxis.greenhopper.jira:gh-sprint',
                                                                                                     'customId' => 10020,
                                                                                                     'items' => 'json',
                                                                                                     'type' => 'array'
                                                                                                   }
                                                                                     },
                                                              'priority' => {
                                                                              'key' => 'priority',
                                                                              'defaultValue' => {
                                                                                                  'name' => '200',
                                                                                                  'avatarId' => 10679,
                                                                                                  'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10679?size=medium',
                                                                                                  'id' => '10013',
                                                                                                  'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10013'
                                                                                                },
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'operations' => [
                                                                                                'set'
                                                                                              ],
                                                                              'schema' => {
                                                                                            'system' => 'priority',
                                                                                            'type' => 'priority'
                                                                                          },
                                                                              'name' => 'Priority',
                                                                              'allowedValues' => [
                                                                                                   {
                                                                                                     'avatarId' => 10674,
                                                                                                     'name' => '500',
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10674?size=medium',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10010',
                                                                                                     'id' => '10010'
                                                                                                   },
                                                                                                   {
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10011',
                                                                                                     'id' => '10011',
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10677?size=medium',
                                                                                                     'name' => '400',
                                                                                                     'avatarId' => 10677
                                                                                                   },
                                                                                                   {
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10672?size=medium',
                                                                                                     'name' => '300',
                                                                                                     'avatarId' => 10672,
                                                                                                     'id' => '10012',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10012'
                                                                                                   },
                                                                                                   {
                                                                                                     'avatarId' => 10679,
                                                                                                     'name' => '200',
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10679?size=medium',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10013',
                                                                                                     'id' => '10013'
                                                                                                   },
                                                                                                   {
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10014',
                                                                                                     'id' => '10014',
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10673?size=medium',
                                                                                                     'avatarId' => 10673,
                                                                                                     'name' => '100'
                                                                                                   }
                                                                                                 ]
                                                                            },
                                                              'customfield_10983' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Original estimate',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'key' => 'customfield_10983',
                                                                                       'schema' => {
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:float',
                                                                                                     'customId' => 10983,
                                                                                                     'type' => 'number'
                                                                                                   }
                                                                                     }
                                                            },
                                                'expand' => 'fields',
                                                'id' => '10007',
                                                'subtask' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                'description' => 'A problem or error.',
                                                'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/issuetype/avatar/10572?size=medium',
                                                'name' => 'Bug',
                                                'hierarchyLevel' => 0,
                                                'untranslatedName' => 'Bug',
                                                'self' => 'https://appgateinc.atlassian.net/rest/api/2/issuetype/10007'
                                              },
                                              {
                                                'iconUrl' => 'https://appgateinc.atlassian.net/images/icons/issuetypes/epic.svg',
                                                'name' => 'Epic',
                                                'hierarchyLevel' => 1,
                                                'untranslatedName' => 'Epic',
                                                'self' => 'https://appgateinc.atlassian.net/rest/api/2/issuetype/10000',
                                                'fields' => {
                                                              'reporter' => {
                                                                              'autoCompleteUrl' => 'https://appgateinc.atlassian.net/rest/api/2/user/recommend?context=Reporter&issueKey=',
                                                                              'operations' => [
                                                                                                'set'
                                                                                              ],
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                              'name' => 'Reporter',
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                              'schema' => {
                                                                                            'type' => 'user',
                                                                                            'system' => 'reporter'
                                                                                          },
                                                                              'key' => 'reporter'
                                                                            },
                                                              'customfield_10752' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Original Creation Date',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'key' => 'customfield_10752',
                                                                                       'schema' => {
                                                                                                     'customId' => 10752,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:datepicker',
                                                                                                     'type' => 'date'
                                                                                                   }
                                                                                     },
                                                              'duedate' => {
                                                                             'operations' => [
                                                                                               'set'
                                                                                             ],
                                                                             'name' => 'Due date',
                                                                             'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'schema' => {
                                                                                           'system' => 'duedate',
                                                                                           'type' => 'date'
                                                                                         },
                                                                             'key' => 'duedate'
                                                                           },
                                                              'customfield_10028' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Story Points',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'key' => 'customfield_10028',
                                                                                       'schema' => {
                                                                                                     'customId' => 10028,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:float',
                                                                                                     'type' => 'number'
                                                                                                   }
                                                                                     },
                                                              'customfield_10014' => {
                                                                                       'schema' => {
                                                                                                     'type' => 'any',
                                                                                                     'custom' => 'com.pyxis.greenhopper.jira:gh-epic-link',
                                                                                                     'customId' => 10014
                                                                                                   },
                                                                                       'key' => 'customfield_10014',
                                                                                       'name' => 'Epic Link',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'customfield_11016' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'schema' => {
                                                                                                     'type' => 'string',
                                                                                                     'customId' => 11016,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:textarea'
                                                                                                   },
                                                                                       'key' => 'customfield_11016',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Release note',
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                     },
                                                              'assignee' => {
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'name' => 'Assignee',
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'key' => 'assignee',
                                                                              'schema' => {
                                                                                            'system' => 'assignee',
                                                                                            'type' => 'user'
                                                                                          },
                                                                              'autoCompleteUrl' => 'https://appgateinc.atlassian.net/rest/api/2/user/assignable/search?project=ZT27&query=',
                                                                              'operations' => [
                                                                                                'set'
                                                                                              ]
                                                                            },
                                                              'project' => {
                                                                             'allowedValues' => [
                                                                                                  {
                                                                                                    'name' => 'ZTNA - Test 27',
                                                                                                    'avatarUrls' => {
                                                                                                                      '16x16' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=xsmall',
                                                                                                                      '48x48' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402',
                                                                                                                      '32x32' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=medium',
                                                                                                                      '24x24' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=small'
                                                                                                                    },
                                                                                                    'simplified' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                    'self' => 'https://appgateinc.atlassian.net/rest/api/2/project/10565',
                                                                                                    'key' => 'ZT27',
                                                                                                    'projectTypeKey' => 'software',
                                                                                                    'projectCategory' => {
                                                                                                                           'name' => 'ZTNA',
                                                                                                                           'self' => 'https://appgateinc.atlassian.net/rest/api/2/projectCategory/10013',
                                                                                                                           'description' => 'ZTNA Projects',
                                                                                                                           'id' => '10013'
                                                                                                                         },
                                                                                                    'id' => '10565'
                                                                                                  }
                                                                                                ],
                                                                             'operations' => [
                                                                                               'set'
                                                                                             ],
                                                                             'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                             'name' => 'Project',
                                                                             'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'schema' => {
                                                                                           'type' => 'project',
                                                                                           'system' => 'project'
                                                                                         },
                                                                             'key' => 'project'
                                                                           },
                                                              'customfield_10950' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'schema' => {
                                                                                                     'type' => 'string',
                                                                                                     'customId' => 10950,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:url'
                                                                                                   },
                                                                                       'key' => 'customfield_10950',
                                                                                       'name' => 'Craft link',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                     },
                                                              'summary' => {
                                                                             'name' => 'Summary',
                                                                             'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                             'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'key' => 'summary',
                                                                             'schema' => {
                                                                                           'type' => 'string',
                                                                                           'system' => 'summary'
                                                                                         },
                                                                             'operations' => [
                                                                                               'set'
                                                                                             ]
                                                                           },
                                                              'timetracking' => {
                                                                                  'operations' => [
                                                                                                    'set',
                                                                                                    'edit'
                                                                                                  ],
                                                                                  'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                  'name' => 'Time tracking',
                                                                                  'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                  'key' => 'timetracking',
                                                                                  'schema' => {
                                                                                                'system' => 'timetracking',
                                                                                                'type' => 'timetracking'
                                                                                              }
                                                                                },
                                                              'customfield_10020' => {
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Sprint',
                                                                                       'key' => 'customfield_10020',
                                                                                       'schema' => {
                                                                                                     'items' => 'json',
                                                                                                     'type' => 'array',
                                                                                                     'custom' => 'com.pyxis.greenhopper.jira:gh-sprint',
                                                                                                     'customId' => 10020
                                                                                                   },
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'versions' => {
                                                                              'schema' => {
                                                                                            'type' => 'array',
                                                                                            'items' => 'version',
                                                                                            'system' => 'versions'
                                                                                          },
                                                                              'key' => 'versions',
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'name' => 'Affects versions',
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'allowedValues' => [
                                                                                                   {
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13669',
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'id' => '13669',
                                                                                                     'projectId' => 10565,
                                                                                                     'name' => '0.8',
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                                   },
                                                                                                   {
                                                                                                     'projectId' => 10565,
                                                                                                     'name' => '0.7',
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13696',
                                                                                                     'id' => '13696'
                                                                                                   },
                                                                                                   {
                                                                                                     'id' => '13697',
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13697',
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'projectId' => 10565,
                                                                                                     'name' => '0.9'
                                                                                                   },
                                                                                                   {
                                                                                                     'projectId' => 10565,
                                                                                                     'name' => '6.6',
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13698',
                                                                                                     'id' => '13698'
                                                                                                   }
                                                                                                 ],
                                                                              'operations' => [
                                                                                                'set',
                                                                                                'add',
                                                                                                'remove'
                                                                                              ]
                                                                            },
                                                              'customfield_10818' => {
                                                                                       'key' => 'customfield_10818',
                                                                                       'defaultValue' => [
                                                                                                           {
                                                                                                             'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11349',
                                                                                                             'id' => '11349',
                                                                                                             'value' => 'Not reviewed'
                                                                                                           }
                                                                                                         ],
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'operations' => [
                                                                                                         'add',
                                                                                                         'set',
                                                                                                         'remove'
                                                                                                       ],
                                                                                       'schema' => {
                                                                                                     'type' => 'array',
                                                                                                     'items' => 'option',
                                                                                                     'customId' => 10818,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:multiselect'
                                                                                                   },
                                                                                       'name' => 'ZTNA Impact',
                                                                                       'allowedValues' => [
                                                                                                            {
                                                                                                              'value' => 'No Impact',
                                                                                                              'id' => '11345',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11345'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Docs Needs Update',
                                                                                                              'id' => '11346',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11346'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11347',
                                                                                                              'value' => 'Release Notes Needs Update',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11347'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11348',
                                                                                                              'id' => '11348',
                                                                                                              'value' => 'VPAT Needs Update'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11349',
                                                                                                              'value' => 'Not reviewed',
                                                                                                              'id' => '11349'
                                                                                                            }
                                                                                                          ]
                                                                                     },
                                                              'attachment' => {
                                                                                'operations' => [
                                                                                                  'set',
                                                                                                  'copy'
                                                                                                ],
                                                                                'key' => 'attachment',
                                                                                'schema' => {
                                                                                              'system' => 'attachment',
                                                                                              'items' => 'attachment',
                                                                                              'type' => 'array'
                                                                                            },
                                                                                'name' => 'Attachment',
                                                                                'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                              },
                                                              'description' => {
                                                                                 'operations' => [
                                                                                                   'set'
                                                                                                 ],
                                                                                 'schema' => {
                                                                                               'type' => 'string',
                                                                                               'system' => 'description'
                                                                                             },
                                                                                 'key' => 'description',
                                                                                 'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'name' => 'Description',
                                                                                 'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                               },
                                                              'fixVersions' => {
                                                                                 'key' => 'fixVersions',
                                                                                 'schema' => {
                                                                                               'items' => 'version',
                                                                                               'type' => 'array',
                                                                                               'system' => 'fixVersions'
                                                                                             },
                                                                                 'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'name' => 'Fix versions',
                                                                                 'operations' => [
                                                                                                   'set',
                                                                                                   'add',
                                                                                                   'remove'
                                                                                                 ],
                                                                                 'allowedValues' => [
                                                                                                      {
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13669',
                                                                                                        'id' => '13669',
                                                                                                        'projectId' => 10565,
                                                                                                        'name' => '0.8',
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                                      },
                                                                                                      {
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'name' => '0.7',
                                                                                                        'projectId' => 10565,
                                                                                                        'id' => '13696',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13696'
                                                                                                      },
                                                                                                      {
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13697',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'id' => '13697',
                                                                                                        'name' => '0.9',
                                                                                                        'projectId' => 10565,
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                                      },
                                                                                                      {
                                                                                                        'id' => '13698',
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13698',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'name' => '6.6',
                                                                                                        'projectId' => 10565
                                                                                                      }
                                                                                                    ]
                                                                               },
                                                              'components' => {
                                                                                'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'name' => 'Components',
                                                                                'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'schema' => {
                                                                                              'system' => 'components',
                                                                                              'items' => 'component',
                                                                                              'type' => 'array'
                                                                                            },
                                                                                'key' => 'components',
                                                                                'operations' => [
                                                                                                  'add',
                                                                                                  'set',
                                                                                                  'remove'
                                                                                                ],
                                                                                'allowedValues' => []
                                                                              },
                                                              'customfield_10720' => {
                                                                                       'allowedValues' => [
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11253',
                                                                                                              'value' => 'No Team',
                                                                                                              'id' => '11253'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11254',
                                                                                                              'value' => 'Core',
                                                                                                              'id' => '11254'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11255',
                                                                                                              'id' => '11255',
                                                                                                              'value' => 'Data Plane'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11256',
                                                                                                              'id' => '11256',
                                                                                                              'value' => 'Integrations'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Platform',
                                                                                                              'id' => '11257',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11257'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11258',
                                                                                                              'value' => 'UI',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11258'
                                                                                                            }
                                                                                                          ],
                                                                                       'name' => 'ZTNA Team',
                                                                                       'schema' => {
                                                                                                     'customId' => 10720,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:select',
                                                                                                     'type' => 'option'
                                                                                                   },
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'defaultValue' => {
                                                                                                           'id' => '11253',
                                                                                                           'value' => 'No Team',
                                                                                                           'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11253'
                                                                                                         },
                                                                                       'key' => 'customfield_10720'
                                                                                     },
                                                              'customfield_10983' => {
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Original estimate',
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'key' => 'customfield_10983',
                                                                                       'schema' => {
                                                                                                     'type' => 'number',
                                                                                                     'customId' => 10983,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:float'
                                                                                                   },
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'customfield_10851' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'defaultValue' => {
                                                                                                           'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11350',
                                                                                                           'value' => 'Other',
                                                                                                           'id' => '11350'
                                                                                                         },
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'key' => 'customfield_10851',
                                                                                       'allowedValues' => [
                                                                                                            {
                                                                                                              'id' => '11351',
                                                                                                              'value' => 'Advisor',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11351'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11352',
                                                                                                              'value' => 'Aitorbot',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11352'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11353',
                                                                                                              'value' => 'Appliance',
                                                                                                              'id' => '11353'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11354',
                                                                                                              'value' => 'Arc (Container)',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11354'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11355',
                                                                                                              'value' => 'CI/CD',
                                                                                                              'id' => '11355'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11356',
                                                                                                              'value' => 'Clean Pipe',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11356'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11357',
                                                                                                              'value' => 'Client',
                                                                                                              'id' => '11357'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11478',
                                                                                                              'id' => '11478',
                                                                                                              'value' => 'Controller'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11358',
                                                                                                              'id' => '11358',
                                                                                                              'value' => 'Connector'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'DevOps',
                                                                                                              'id' => '11359',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11359'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Envy',
                                                                                                              'id' => '11360',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11360'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11361',
                                                                                                              'id' => '11361',
                                                                                                              'value' => 'Frontend'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Gateway',
                                                                                                              'id' => '11362',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11362'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11363',
                                                                                                              'id' => '11363',
                                                                                                              'value' => 'Helvetest'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11364',
                                                                                                              'value' => 'Injector',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11364'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11365',
                                                                                                              'value' => 'LogServer & Forwarder',
                                                                                                              'id' => '11365'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11366',
                                                                                                              'value' => 'Manual ',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11366'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11367',
                                                                                                              'id' => '11367',
                                                                                                              'value' => 'Metrics'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11368',
                                                                                                              'value' => 'Operator',
                                                                                                              'id' => '11368'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11369',
                                                                                                              'value' => 'Portal',
                                                                                                              'id' => '11369'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11350',
                                                                                                              'value' => 'Other',
                                                                                                              'id' => '11350'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11370',
                                                                                                              'value' => 'SDK',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11370'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11371',
                                                                                                              'id' => '11371',
                                                                                                              'value' => 'SDPCTL'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11372',
                                                                                                              'id' => '11372',
                                                                                                              'value' => 'Terraform Provider'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11477',
                                                                                                              'value' => 'Test',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11477'
                                                                                                            }
                                                                                                          ],
                                                                                       'name' => 'ZTNA Subsystem',
                                                                                       'schema' => {
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:select',
                                                                                                     'customId' => 10851,
                                                                                                     'type' => 'option'
                                                                                                   }
                                                                                     },
                                                              'labels' => {
                                                                            'autoCompleteUrl' => 'https://appgateinc.atlassian.net/rest/api/1.0/labels/suggest?query=',
                                                                            'operations' => [
                                                                                              'add',
                                                                                              'set',
                                                                                              'remove'
                                                                                            ],
                                                                            'name' => 'Labels',
                                                                            'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'schema' => {
                                                                                          'system' => 'labels',
                                                                                          'type' => 'array',
                                                                                          'items' => 'string'
                                                                                        },
                                                                            'key' => 'labels'
                                                                          },
                                                              'priority' => {
                                                                              'operations' => [
                                                                                                'set'
                                                                                              ],
                                                                              'defaultValue' => {
                                                                                                  'name' => '200',
                                                                                                  'avatarId' => 10679,
                                                                                                  'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10679?size=medium',
                                                                                                  'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10013',
                                                                                                  'id' => '10013'
                                                                                                },
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'key' => 'priority',
                                                                              'allowedValues' => [
                                                                                                   {
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10674?size=medium',
                                                                                                     'avatarId' => 10674,
                                                                                                     'name' => '500',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10010',
                                                                                                     'id' => '10010'
                                                                                                   },
                                                                                                   {
                                                                                                     'id' => '10011',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10011',
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10677?size=medium',
                                                                                                     'name' => '400',
                                                                                                     'avatarId' => 10677
                                                                                                   },
                                                                                                   {
                                                                                                     'id' => '10012',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10012',
                                                                                                     'name' => '300',
                                                                                                     'avatarId' => 10672,
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10672?size=medium'
                                                                                                   },
                                                                                                   {
                                                                                                     'id' => '10013',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10013',
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10679?size=medium',
                                                                                                     'name' => '200',
                                                                                                     'avatarId' => 10679
                                                                                                   },
                                                                                                   {
                                                                                                     'name' => '100',
                                                                                                     'avatarId' => 10673,
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10673?size=medium',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10014',
                                                                                                     'id' => '10014'
                                                                                                   }
                                                                                                 ],
                                                                              'name' => 'Priority',
                                                                              'schema' => {
                                                                                            'type' => 'priority',
                                                                                            'system' => 'priority'
                                                                                          }
                                                                            },
                                                              'issuetype' => {
                                                                               'allowedValues' => [
                                                                                                    {
                                                                                                      'subtask' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                      'id' => '10000',
                                                                                                      'description' => 'A big user story that needs to be broken down. Created by Jira Software - do not edit or delete.',
                                                                                                      'name' => 'Epic',
                                                                                                      'iconUrl' => 'https://appgateinc.atlassian.net/images/icons/issuetypes/epic.svg',
                                                                                                      'hierarchyLevel' => 1,
                                                                                                      'self' => 'https://appgateinc.atlassian.net/rest/api/2/issuetype/10000'
                                                                                                    }
                                                                                                  ],
                                                                               'operations' => [],
                                                                               'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                               'name' => 'Issue Type',
                                                                               'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                               'schema' => {
                                                                                             'type' => 'issuetype',
                                                                                             'system' => 'issuetype'
                                                                                           },
                                                                               'key' => 'issuetype'
                                                                             }
                                                            },
                                                'expand' => 'fields',
                                                'id' => '10000',
                                                'subtask' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                'description' => 'A big user story that needs to be broken down. Created by Jira Software - do not edit or delete.'
                                              },
                                              {
                                                'hierarchyLevel' => 0,
                                                'untranslatedName' => 'Security',
                                                'self' => 'https://appgateinc.atlassian.net/rest/api/2/issuetype/10347',
                                                'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/issuetype/avatar/10323?size=medium',
                                                'name' => 'Security',
                                                'id' => '10347',
                                                'subtask' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                'description' => '',
                                                'expand' => 'fields',
                                                'fields' => {
                                                              'customfield_10014' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'key' => 'customfield_10014',
                                                                                       'schema' => {
                                                                                                     'type' => 'any',
                                                                                                     'customId' => 10014,
                                                                                                     'custom' => 'com.pyxis.greenhopper.jira:gh-epic-link'
                                                                                                   },
                                                                                       'name' => 'Epic Link',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                     },
                                                              'customfield_10950' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Craft link',
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'schema' => {
                                                                                                     'type' => 'string',
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:url',
                                                                                                     'customId' => 10950
                                                                                                   },
                                                                                       'key' => 'customfield_10950'
                                                                                     },
                                                              'reporter' => {
                                                                              'schema' => {
                                                                                            'system' => 'reporter',
                                                                                            'type' => 'user'
                                                                                          },
                                                                              'key' => 'reporter',
                                                                              'name' => 'Reporter',
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                              'operations' => [
                                                                                                'set'
                                                                                              ],
                                                                              'autoCompleteUrl' => 'https://appgateinc.atlassian.net/rest/api/2/user/recommend?context=Reporter&issueKey='
                                                                            },
                                                              'customfield_10752' => {
                                                                                       'schema' => {
                                                                                                     'customId' => 10752,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:datepicker',
                                                                                                     'type' => 'date'
                                                                                                   },
                                                                                       'key' => 'customfield_10752',
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Original Creation Date',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'customfield_10983' => {
                                                                                       'schema' => {
                                                                                                     'customId' => 10983,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:float',
                                                                                                     'type' => 'number'
                                                                                                   },
                                                                                       'key' => 'customfield_10983',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Original estimate',
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'priority' => {
                                                                              'name' => 'Priority',
                                                                              'schema' => {
                                                                                            'system' => 'priority',
                                                                                            'type' => 'priority'
                                                                                          },
                                                                              'allowedValues' => [
                                                                                                   {
                                                                                                     'avatarId' => 10674,
                                                                                                     'name' => '500',
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10674?size=medium',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10010',
                                                                                                     'id' => '10010'
                                                                                                   },
                                                                                                   {
                                                                                                     'id' => '10011',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10011',
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10677?size=medium',
                                                                                                     'name' => '400',
                                                                                                     'avatarId' => 10677
                                                                                                   },
                                                                                                   {
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10012',
                                                                                                     'id' => '10012',
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10672?size=medium',
                                                                                                     'avatarId' => 10672,
                                                                                                     'name' => '300'
                                                                                                   },
                                                                                                   {
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10679?size=medium',
                                                                                                     'avatarId' => 10679,
                                                                                                     'name' => '200',
                                                                                                     'id' => '10013',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10013'
                                                                                                   },
                                                                                                   {
                                                                                                     'id' => '10014',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10014',
                                                                                                     'name' => '100',
                                                                                                     'avatarId' => 10673,
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10673?size=medium'
                                                                                                   }
                                                                                                 ],
                                                                              'defaultValue' => {
                                                                                                  'id' => '10013',
                                                                                                  'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10013',
                                                                                                  'name' => '200',
                                                                                                  'avatarId' => 10679,
                                                                                                  'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10679?size=medium'
                                                                                                },
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'key' => 'priority',
                                                                              'operations' => [
                                                                                                'set'
                                                                                              ]
                                                                            },
                                                              'customfield_10020' => {
                                                                                       'key' => 'customfield_10020',
                                                                                       'schema' => {
                                                                                                     'items' => 'json',
                                                                                                     'type' => 'array',
                                                                                                     'custom' => 'com.pyxis.greenhopper.jira:gh-sprint',
                                                                                                     'customId' => 10020
                                                                                                   },
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Sprint',
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'timetracking' => {
                                                                                  'schema' => {
                                                                                                'type' => 'timetracking',
                                                                                                'system' => 'timetracking'
                                                                                              },
                                                                                  'key' => 'timetracking',
                                                                                  'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                  'name' => 'Time tracking',
                                                                                  'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                  'operations' => [
                                                                                                    'set',
                                                                                                    'edit'
                                                                                                  ]
                                                                                },
                                                              'summary' => {
                                                                             'schema' => {
                                                                                           'system' => 'summary',
                                                                                           'type' => 'string'
                                                                                         },
                                                                             'key' => 'summary',
                                                                             'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                             'name' => 'Summary',
                                                                             'operations' => [
                                                                                               'set'
                                                                                             ]
                                                                           },
                                                              'customfield_10720' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'key' => 'customfield_10720',
                                                                                       'defaultValue' => {
                                                                                                           'value' => 'No Team',
                                                                                                           'id' => '11253',
                                                                                                           'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11253'
                                                                                                         },
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'allowedValues' => [
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11253',
                                                                                                              'value' => 'No Team',
                                                                                                              'id' => '11253'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11254',
                                                                                                              'id' => '11254',
                                                                                                              'value' => 'Core'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11255',
                                                                                                              'value' => 'Data Plane',
                                                                                                              'id' => '11255'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11256',
                                                                                                              'id' => '11256',
                                                                                                              'value' => 'Integrations'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11257',
                                                                                                              'value' => 'Platform',
                                                                                                              'id' => '11257'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11258',
                                                                                                              'value' => 'UI',
                                                                                                              'id' => '11258'
                                                                                                            }
                                                                                                          ],
                                                                                       'schema' => {
                                                                                                     'type' => 'option',
                                                                                                     'customId' => 10720,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:select'
                                                                                                   },
                                                                                       'name' => 'ZTNA Team'
                                                                                     },
                                                              'fixVersions' => {
                                                                                 'schema' => {
                                                                                               'system' => 'fixVersions',
                                                                                               'type' => 'array',
                                                                                               'items' => 'version'
                                                                                             },
                                                                                 'key' => 'fixVersions',
                                                                                 'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'name' => 'Fix versions',
                                                                                 'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'operations' => [
                                                                                                   'set',
                                                                                                   'add',
                                                                                                   'remove'
                                                                                                 ],
                                                                                 'allowedValues' => [
                                                                                                      {
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13669',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'id' => '13669',
                                                                                                        'name' => '0.8',
                                                                                                        'projectId' => 10565,
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                                      },
                                                                                                      {
                                                                                                        'id' => '13696',
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13696',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'projectId' => 10565,
                                                                                                        'name' => '0.7'
                                                                                                      },
                                                                                                      {
                                                                                                        'id' => '13697',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13697',
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'projectId' => 10565,
                                                                                                        'name' => '0.9'
                                                                                                      },
                                                                                                      {
                                                                                                        'id' => '13698',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13698',
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'projectId' => 10565,
                                                                                                        'name' => '6.6'
                                                                                                      }
                                                                                                    ]
                                                                               },
                                                              'customfield_10028' => {
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Story Points',
                                                                                       'schema' => {
                                                                                                     'type' => 'number',
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:float',
                                                                                                     'customId' => 10028
                                                                                                   },
                                                                                       'key' => 'customfield_10028',
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'assignee' => {
                                                                              'name' => 'Assignee',
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'key' => 'assignee',
                                                                              'schema' => {
                                                                                            'system' => 'assignee',
                                                                                            'type' => 'user'
                                                                                          },
                                                                              'autoCompleteUrl' => 'https://appgateinc.atlassian.net/rest/api/2/user/assignable/search?project=ZT27&query=',
                                                                              'operations' => [
                                                                                                'set'
                                                                                              ]
                                                                            },
                                                              'customfield_11016' => {
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Release note',
                                                                                       'schema' => {
                                                                                                     'type' => 'string',
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:textarea',
                                                                                                     'customId' => 11016
                                                                                                   },
                                                                                       'key' => 'customfield_11016',
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'project' => {
                                                                             'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'name' => 'Project',
                                                                             'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                             'schema' => {
                                                                                           'system' => 'project',
                                                                                           'type' => 'project'
                                                                                         },
                                                                             'key' => 'project',
                                                                             'operations' => [
                                                                                               'set'
                                                                                             ],
                                                                             'allowedValues' => [
                                                                                                  {
                                                                                                    'avatarUrls' => {
                                                                                                                      '16x16' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=xsmall',
                                                                                                                      '48x48' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402',
                                                                                                                      '32x32' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=medium',
                                                                                                                      '24x24' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=small'
                                                                                                                    },
                                                                                                    'simplified' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                    'self' => 'https://appgateinc.atlassian.net/rest/api/2/project/10565',
                                                                                                    'name' => 'ZTNA - Test 27',
                                                                                                    'id' => '10565',
                                                                                                    'key' => 'ZT27',
                                                                                                    'projectTypeKey' => 'software',
                                                                                                    'projectCategory' => {
                                                                                                                           'name' => 'ZTNA',
                                                                                                                           'id' => '10013',
                                                                                                                           'self' => 'https://appgateinc.atlassian.net/rest/api/2/projectCategory/10013',
                                                                                                                           'description' => 'ZTNA Projects'
                                                                                                                         }
                                                                                                  }
                                                                                                ]
                                                                           },
                                                              'parent' => {
                                                                            'operations' => [
                                                                                              'set'
                                                                                            ],
                                                                            'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'name' => 'Parent',
                                                                            'key' => 'parent',
                                                                            'schema' => {
                                                                                          'system' => 'parent',
                                                                                          'type' => 'issuelink'
                                                                                        }
                                                                          },
                                                              'duedate' => {
                                                                             'schema' => {
                                                                                           'system' => 'duedate',
                                                                                           'type' => 'date'
                                                                                         },
                                                                             'key' => 'duedate',
                                                                             'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'name' => 'Due date',
                                                                             'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'operations' => [
                                                                                               'set'
                                                                                             ]
                                                                           },
                                                              'labels' => {
                                                                            'autoCompleteUrl' => 'https://appgateinc.atlassian.net/rest/api/1.0/labels/suggest?query=',
                                                                            'operations' => [
                                                                                              'add',
                                                                                              'set',
                                                                                              'remove'
                                                                                            ],
                                                                            'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'name' => 'Labels',
                                                                            'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'key' => 'labels',
                                                                            'schema' => {
                                                                                          'system' => 'labels',
                                                                                          'type' => 'array',
                                                                                          'items' => 'string'
                                                                                        }
                                                                          },
                                                              'customfield_10851' => {
                                                                                       'allowedValues' => [
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11351',
                                                                                                              'value' => 'Advisor',
                                                                                                              'id' => '11351'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Aitorbot',
                                                                                                              'id' => '11352',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11352'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11353',
                                                                                                              'value' => 'Appliance',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11353'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11354',
                                                                                                              'id' => '11354',
                                                                                                              'value' => 'Arc (Container)'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11355',
                                                                                                              'value' => 'CI/CD',
                                                                                                              'id' => '11355'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11356',
                                                                                                              'value' => 'Clean Pipe',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11356'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11357',
                                                                                                              'value' => 'Client',
                                                                                                              'id' => '11357'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11478',
                                                                                                              'id' => '11478',
                                                                                                              'value' => 'Controller'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11358',
                                                                                                              'value' => 'Connector',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11358'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'DevOps',
                                                                                                              'id' => '11359',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11359'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11360',
                                                                                                              'value' => 'Envy',
                                                                                                              'id' => '11360'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11361',
                                                                                                              'value' => 'Frontend',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11361'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11362',
                                                                                                              'value' => 'Gateway',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11362'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11363',
                                                                                                              'value' => 'Helvetest',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11363'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11364',
                                                                                                              'id' => '11364',
                                                                                                              'value' => 'Injector'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11365',
                                                                                                              'value' => 'LogServer & Forwarder',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11365'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11366',
                                                                                                              'id' => '11366',
                                                                                                              'value' => 'Manual '
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Metrics',
                                                                                                              'id' => '11367',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11367'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11368',
                                                                                                              'value' => 'Operator',
                                                                                                              'id' => '11368'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11369',
                                                                                                              'id' => '11369',
                                                                                                              'value' => 'Portal'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11350',
                                                                                                              'id' => '11350',
                                                                                                              'value' => 'Other'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'SDK',
                                                                                                              'id' => '11370',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11370'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11371',
                                                                                                              'id' => '11371',
                                                                                                              'value' => 'SDPCTL'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Terraform Provider',
                                                                                                              'id' => '11372',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11372'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11477',
                                                                                                              'value' => 'Test',
                                                                                                              'id' => '11477'
                                                                                                            }
                                                                                                          ],
                                                                                       'name' => 'ZTNA Subsystem',
                                                                                       'schema' => {
                                                                                                     'customId' => 10851,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:select',
                                                                                                     'type' => 'option'
                                                                                                   },
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'defaultValue' => {
                                                                                                           'id' => '11350',
                                                                                                           'value' => 'Other',
                                                                                                           'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11350'
                                                                                                         },
                                                                                       'key' => 'customfield_10851'
                                                                                     },
                                                              'issuetype' => {
                                                                               'operations' => [],
                                                                               'allowedValues' => [
                                                                                                    {
                                                                                                      'avatarId' => 10323,
                                                                                                      'name' => 'Security',
                                                                                                      'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/issuetype/avatar/10323?size=medium',
                                                                                                      'self' => 'https://appgateinc.atlassian.net/rest/api/2/issuetype/10347',
                                                                                                      'hierarchyLevel' => 0,
                                                                                                      'description' => '',
                                                                                                      'subtask' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                      'id' => '10347'
                                                                                                    }
                                                                                                  ],
                                                                               'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                               'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                               'name' => 'Issue Type',
                                                                               'key' => 'issuetype',
                                                                               'schema' => {
                                                                                             'system' => 'issuetype',
                                                                                             'type' => 'issuetype'
                                                                                           }
                                                                             },
                                                              'versions' => {
                                                                              'allowedValues' => [
                                                                                                   {
                                                                                                     'name' => '0.8',
                                                                                                     'projectId' => 10565,
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13669',
                                                                                                     'id' => '13669'
                                                                                                   },
                                                                                                   {
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13696',
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'id' => '13696',
                                                                                                     'name' => '0.7',
                                                                                                     'projectId' => 10565,
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                                   },
                                                                                                   {
                                                                                                     'id' => '13697',
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13697',
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'projectId' => 10565,
                                                                                                     'name' => '0.9'
                                                                                                   },
                                                                                                   {
                                                                                                     'id' => '13698',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13698',
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'name' => '6.6',
                                                                                                     'projectId' => 10565
                                                                                                   }
                                                                                                 ],
                                                                              'operations' => [
                                                                                                'set',
                                                                                                'add',
                                                                                                'remove'
                                                                                              ],
                                                                              'name' => 'Affects versions',
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'key' => 'versions',
                                                                              'schema' => {
                                                                                            'system' => 'versions',
                                                                                            'type' => 'array',
                                                                                            'items' => 'version'
                                                                                          }
                                                                            },
                                                              'attachment' => {
                                                                                'operations' => [
                                                                                                  'set',
                                                                                                  'copy'
                                                                                                ],
                                                                                'name' => 'Attachment',
                                                                                'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'schema' => {
                                                                                              'system' => 'attachment',
                                                                                              'type' => 'array',
                                                                                              'items' => 'attachment'
                                                                                            },
                                                                                'key' => 'attachment'
                                                                              },
                                                              'description' => {
                                                                                 'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'name' => 'Description',
                                                                                 'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'schema' => {
                                                                                               'system' => 'description',
                                                                                               'type' => 'string'
                                                                                             },
                                                                                 'key' => 'description',
                                                                                 'operations' => [
                                                                                                   'set'
                                                                                                 ]
                                                                               },
                                                              'customfield_10818' => {
                                                                                       'allowedValues' => [
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11345',
                                                                                                              'id' => '11345',
                                                                                                              'value' => 'No Impact'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Docs Needs Update',
                                                                                                              'id' => '11346',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11346'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11347',
                                                                                                              'value' => 'Release Notes Needs Update',
                                                                                                              'id' => '11347'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11348',
                                                                                                              'id' => '11348',
                                                                                                              'value' => 'VPAT Needs Update'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Not reviewed',
                                                                                                              'id' => '11349',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11349'
                                                                                                            }
                                                                                                          ],
                                                                                       'schema' => {
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:multiselect',
                                                                                                     'customId' => 10818,
                                                                                                     'items' => 'option',
                                                                                                     'type' => 'array'
                                                                                                   },
                                                                                       'name' => 'ZTNA Impact',
                                                                                       'operations' => [
                                                                                                         'add',
                                                                                                         'set',
                                                                                                         'remove'
                                                                                                       ],
                                                                                       'key' => 'customfield_10818',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'defaultValue' => [
                                                                                                           {
                                                                                                             'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11349',
                                                                                                             'id' => '11349',
                                                                                                             'value' => 'Not reviewed'
                                                                                                           }
                                                                                                         ]
                                                                                     },
                                                              'components' => {
                                                                                'allowedValues' => [],
                                                                                'operations' => [
                                                                                                  'add',
                                                                                                  'set',
                                                                                                  'remove'
                                                                                                ],
                                                                                'key' => 'components',
                                                                                'schema' => {
                                                                                              'type' => 'array',
                                                                                              'items' => 'component',
                                                                                              'system' => 'components'
                                                                                            },
                                                                                'name' => 'Components',
                                                                                'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                              }
                                                            }
                                              },
                                              {
                                                'name' => 'Technical Excellence',
                                                'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/issuetype/avatar/10300?size=medium',
                                                'self' => 'https://appgateinc.atlassian.net/rest/api/2/issuetype/10951',
                                                'untranslatedName' => 'Technical Excellence',
                                                'hierarchyLevel' => 0,
                                                'fields' => {
                                                              'labels' => {
                                                                            'operations' => [
                                                                                              'add',
                                                                                              'set',
                                                                                              'remove'
                                                                                            ],
                                                                            'autoCompleteUrl' => 'https://appgateinc.atlassian.net/rest/api/1.0/labels/suggest?query=',
                                                                            'key' => 'labels',
                                                                            'schema' => {
                                                                                          'system' => 'labels',
                                                                                          'type' => 'array',
                                                                                          'items' => 'string'
                                                                                        },
                                                                            'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'name' => 'Labels',
                                                                            'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                          },
                                                              'customfield_10851' => {
                                                                                       'key' => 'customfield_10851',
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'defaultValue' => {
                                                                                                           'value' => 'Other',
                                                                                                           'id' => '11350',
                                                                                                           'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11350'
                                                                                                         },
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'schema' => {
                                                                                                     'type' => 'option',
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:select',
                                                                                                     'customId' => 10851
                                                                                                   },
                                                                                       'name' => 'ZTNA Subsystem',
                                                                                       'allowedValues' => [
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11351',
                                                                                                              'value' => 'Advisor',
                                                                                                              'id' => '11351'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11352',
                                                                                                              'value' => 'Aitorbot',
                                                                                                              'id' => '11352'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11353',
                                                                                                              'value' => 'Appliance',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11353'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11354',
                                                                                                              'id' => '11354',
                                                                                                              'value' => 'Arc (Container)'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11355',
                                                                                                              'value' => 'CI/CD',
                                                                                                              'id' => '11355'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11356',
                                                                                                              'value' => 'Clean Pipe',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11356'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11357',
                                                                                                              'id' => '11357',
                                                                                                              'value' => 'Client'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Controller',
                                                                                                              'id' => '11478',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11478'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Connector',
                                                                                                              'id' => '11358',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11358'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11359',
                                                                                                              'id' => '11359',
                                                                                                              'value' => 'DevOps'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Envy',
                                                                                                              'id' => '11360',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11360'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11361',
                                                                                                              'value' => 'Frontend',
                                                                                                              'id' => '11361'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Gateway',
                                                                                                              'id' => '11362',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11362'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11363',
                                                                                                              'value' => 'Helvetest',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11363'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11364',
                                                                                                              'value' => 'Injector',
                                                                                                              'id' => '11364'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11365',
                                                                                                              'id' => '11365',
                                                                                                              'value' => 'LogServer & Forwarder'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11366',
                                                                                                              'id' => '11366',
                                                                                                              'value' => 'Manual '
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11367',
                                                                                                              'id' => '11367',
                                                                                                              'value' => 'Metrics'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11368',
                                                                                                              'value' => 'Operator',
                                                                                                              'id' => '11368'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11369',
                                                                                                              'value' => 'Portal',
                                                                                                              'id' => '11369'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11350',
                                                                                                              'value' => 'Other',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11350'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11370',
                                                                                                              'value' => 'SDK',
                                                                                                              'id' => '11370'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11371',
                                                                                                              'value' => 'SDPCTL',
                                                                                                              'id' => '11371'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11372',
                                                                                                              'id' => '11372',
                                                                                                              'value' => 'Terraform Provider'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Test',
                                                                                                              'id' => '11477',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11477'
                                                                                                            }
                                                                                                          ]
                                                                                     },
                                                              'issuetype' => {
                                                                               'allowedValues' => [
                                                                                                    {
                                                                                                      'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/issuetype/avatar/10300?size=medium',
                                                                                                      'name' => 'Technical Excellence',
                                                                                                      'avatarId' => 10300,
                                                                                                      'self' => 'https://appgateinc.atlassian.net/rest/api/2/issuetype/10951',
                                                                                                      'hierarchyLevel' => 0,
                                                                                                      'description' => '',
                                                                                                      'id' => '10951',
                                                                                                      'subtask' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                                    }
                                                                                                  ],
                                                                               'operations' => [],
                                                                               'name' => 'Issue Type',
                                                                               'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                               'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                               'key' => 'issuetype',
                                                                               'schema' => {
                                                                                             'type' => 'issuetype',
                                                                                             'system' => 'issuetype'
                                                                                           }
                                                                             },
                                                              'versions' => {
                                                                              'allowedValues' => [
                                                                                                   {
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'name' => '0.8',
                                                                                                     'projectId' => 10565,
                                                                                                     'id' => '13669',
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13669'
                                                                                                   },
                                                                                                   {
                                                                                                     'id' => '13696',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13696',
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'name' => '0.7',
                                                                                                     'projectId' => 10565
                                                                                                   },
                                                                                                   {
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13697',
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'id' => '13697',
                                                                                                     'name' => '0.9',
                                                                                                     'projectId' => 10565,
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                                   },
                                                                                                   {
                                                                                                     'name' => '6.6',
                                                                                                     'projectId' => 10565,
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13698',
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'id' => '13698'
                                                                                                   }
                                                                                                 ],
                                                                              'operations' => [
                                                                                                'set',
                                                                                                'add',
                                                                                                'remove'
                                                                                              ],
                                                                              'name' => 'Affects versions',
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'schema' => {
                                                                                            'system' => 'versions',
                                                                                            'items' => 'version',
                                                                                            'type' => 'array'
                                                                                          },
                                                                              'key' => 'versions'
                                                                            },
                                                              'components' => {
                                                                                'key' => 'components',
                                                                                'schema' => {
                                                                                              'system' => 'components',
                                                                                              'type' => 'array',
                                                                                              'items' => 'component'
                                                                                            },
                                                                                'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'name' => 'Components',
                                                                                'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'operations' => [
                                                                                                  'add',
                                                                                                  'set',
                                                                                                  'remove'
                                                                                                ],
                                                                                'allowedValues' => []
                                                                              },
                                                              'attachment' => {
                                                                                'operations' => [
                                                                                                  'set',
                                                                                                  'copy'
                                                                                                ],
                                                                                'name' => 'Attachment',
                                                                                'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'schema' => {
                                                                                              'system' => 'attachment',
                                                                                              'type' => 'array',
                                                                                              'items' => 'attachment'
                                                                                            },
                                                                                'key' => 'attachment'
                                                                              },
                                                              'description' => {
                                                                                 'operations' => [
                                                                                                   'set'
                                                                                                 ],
                                                                                 'schema' => {
                                                                                               'system' => 'description',
                                                                                               'type' => 'string'
                                                                                             },
                                                                                 'key' => 'description',
                                                                                 'name' => 'Description',
                                                                                 'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                               },
                                                              'customfield_10818' => {
                                                                                       'defaultValue' => [
                                                                                                           {
                                                                                                             'value' => 'Not reviewed',
                                                                                                             'id' => '11349',
                                                                                                             'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11349'
                                                                                                           }
                                                                                                         ],
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'key' => 'customfield_10818',
                                                                                       'operations' => [
                                                                                                         'add',
                                                                                                         'set',
                                                                                                         'remove'
                                                                                                       ],
                                                                                       'name' => 'ZTNA Impact',
                                                                                       'schema' => {
                                                                                                     'customId' => 10818,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:multiselect',
                                                                                                     'type' => 'array',
                                                                                                     'items' => 'option'
                                                                                                   },
                                                                                       'allowedValues' => [
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11345',
                                                                                                              'value' => 'No Impact',
                                                                                                              'id' => '11345'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11346',
                                                                                                              'id' => '11346',
                                                                                                              'value' => 'Docs Needs Update'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11347',
                                                                                                              'id' => '11347',
                                                                                                              'value' => 'Release Notes Needs Update'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11348',
                                                                                                              'value' => 'VPAT Needs Update',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11348'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11349',
                                                                                                              'id' => '11349',
                                                                                                              'value' => 'Not reviewed'
                                                                                                            }
                                                                                                          ]
                                                                                     },
                                                              'assignee' => {
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'name' => 'Assignee',
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'schema' => {
                                                                                            'system' => 'assignee',
                                                                                            'type' => 'user'
                                                                                          },
                                                                              'key' => 'assignee',
                                                                              'autoCompleteUrl' => 'https://appgateinc.atlassian.net/rest/api/2/user/assignable/search?project=ZT27&query=',
                                                                              'operations' => [
                                                                                                'set'
                                                                                              ]
                                                                            },
                                                              'customfield_11016' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'name' => 'Release note',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'schema' => {
                                                                                                     'type' => 'string',
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:textarea',
                                                                                                     'customId' => 11016
                                                                                                   },
                                                                                       'key' => 'customfield_11016'
                                                                                     },
                                                              'customfield_10028' => {
                                                                                       'key' => 'customfield_10028',
                                                                                       'schema' => {
                                                                                                     'type' => 'number',
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:float',
                                                                                                     'customId' => 10028
                                                                                                   },
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Story Points',
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'project' => {
                                                                             'allowedValues' => [
                                                                                                  {
                                                                                                    'avatarUrls' => {
                                                                                                                      '24x24' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=small',
                                                                                                                      '32x32' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=medium',
                                                                                                                      '16x16' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=xsmall',
                                                                                                                      '48x48' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402'
                                                                                                                    },
                                                                                                    'simplified' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                    'self' => 'https://appgateinc.atlassian.net/rest/api/2/project/10565',
                                                                                                    'name' => 'ZTNA - Test 27',
                                                                                                    'id' => '10565',
                                                                                                    'key' => 'ZT27',
                                                                                                    'projectCategory' => {
                                                                                                                           'self' => 'https://appgateinc.atlassian.net/rest/api/2/projectCategory/10013',
                                                                                                                           'description' => 'ZTNA Projects',
                                                                                                                           'id' => '10013',
                                                                                                                           'name' => 'ZTNA'
                                                                                                                         },
                                                                                                    'projectTypeKey' => 'software'
                                                                                                  }
                                                                                                ],
                                                                             'operations' => [
                                                                                               'set'
                                                                                             ],
                                                                             'name' => 'Project',
                                                                             'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                             'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'schema' => {
                                                                                           'system' => 'project',
                                                                                           'type' => 'project'
                                                                                         },
                                                                             'key' => 'project'
                                                                           },
                                                              'duedate' => {
                                                                             'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'name' => 'Due date',
                                                                             'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'key' => 'duedate',
                                                                             'schema' => {
                                                                                           'system' => 'duedate',
                                                                                           'type' => 'date'
                                                                                         },
                                                                             'operations' => [
                                                                                               'set'
                                                                                             ]
                                                                           },
                                                              'parent' => {
                                                                            'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'name' => 'Parent',
                                                                            'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'key' => 'parent',
                                                                            'schema' => {
                                                                                          'type' => 'issuelink',
                                                                                          'system' => 'parent'
                                                                                        },
                                                                            'operations' => [
                                                                                              'set'
                                                                                            ]
                                                                          },
                                                              'customfield_10983' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'key' => 'customfield_10983',
                                                                                       'schema' => {
                                                                                                     'type' => 'number',
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:float',
                                                                                                     'customId' => 10983
                                                                                                   },
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Original estimate',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                     },
                                                              'priority' => {
                                                                              'name' => 'Priority',
                                                                              'schema' => {
                                                                                            'system' => 'priority',
                                                                                            'type' => 'priority'
                                                                                          },
                                                                              'allowedValues' => [
                                                                                                   {
                                                                                                     'name' => '500',
                                                                                                     'avatarId' => 10674,
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10674?size=medium',
                                                                                                     'id' => '10010',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10010'
                                                                                                   },
                                                                                                   {
                                                                                                     'id' => '10011',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10011',
                                                                                                     'name' => '400',
                                                                                                     'avatarId' => 10677,
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10677?size=medium'
                                                                                                   },
                                                                                                   {
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10672?size=medium',
                                                                                                     'avatarId' => 10672,
                                                                                                     'name' => '300',
                                                                                                     'id' => '10012',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10012'
                                                                                                   },
                                                                                                   {
                                                                                                     'id' => '10013',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10013',
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10679?size=medium',
                                                                                                     'name' => '200',
                                                                                                     'avatarId' => 10679
                                                                                                   },
                                                                                                   {
                                                                                                     'id' => '10014',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10014',
                                                                                                     'avatarId' => 10673,
                                                                                                     'name' => '100',
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10673?size=medium'
                                                                                                   }
                                                                                                 ],
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                              'defaultValue' => {
                                                                                                  'name' => '200',
                                                                                                  'avatarId' => 10679,
                                                                                                  'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10679?size=medium',
                                                                                                  'id' => '10013',
                                                                                                  'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10013'
                                                                                                },
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'key' => 'priority',
                                                                              'operations' => [
                                                                                                'set'
                                                                                              ]
                                                                            },
                                                              'customfield_10020' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'schema' => {
                                                                                                     'customId' => 10020,
                                                                                                     'custom' => 'com.pyxis.greenhopper.jira:gh-sprint',
                                                                                                     'type' => 'array',
                                                                                                     'items' => 'json'
                                                                                                   },
                                                                                       'key' => 'customfield_10020',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Sprint',
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                     },
                                                              'summary' => {
                                                                             'operations' => [
                                                                                               'set'
                                                                                             ],
                                                                             'name' => 'Summary',
                                                                             'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                             'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'schema' => {
                                                                                           'system' => 'summary',
                                                                                           'type' => 'string'
                                                                                         },
                                                                             'key' => 'summary'
                                                                           },
                                                              'timetracking' => {
                                                                                  'schema' => {
                                                                                                'type' => 'timetracking',
                                                                                                'system' => 'timetracking'
                                                                                              },
                                                                                  'key' => 'timetracking',
                                                                                  'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                  'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                  'name' => 'Time tracking',
                                                                                  'operations' => [
                                                                                                    'set',
                                                                                                    'edit'
                                                                                                  ]
                                                                                },
                                                              'customfield_10720' => {
                                                                                       'schema' => {
                                                                                                     'customId' => 10720,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:select',
                                                                                                     'type' => 'option'
                                                                                                   },
                                                                                       'name' => 'ZTNA Team',
                                                                                       'allowedValues' => [
                                                                                                            {
                                                                                                              'id' => '11253',
                                                                                                              'value' => 'No Team',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11253'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11254',
                                                                                                              'value' => 'Core',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11254'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11255',
                                                                                                              'value' => 'Data Plane',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11255'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Integrations',
                                                                                                              'id' => '11256',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11256'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11257',
                                                                                                              'value' => 'Platform',
                                                                                                              'id' => '11257'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'UI',
                                                                                                              'id' => '11258',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11258'
                                                                                                            }
                                                                                                          ],
                                                                                       'key' => 'customfield_10720',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'defaultValue' => {
                                                                                                           'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11253',
                                                                                                           'value' => 'No Team',
                                                                                                           'id' => '11253'
                                                                                                         },
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'fixVersions' => {
                                                                                 'allowedValues' => [
                                                                                                      {
                                                                                                        'id' => '13669',
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13669',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'projectId' => 10565,
                                                                                                        'name' => '0.8'
                                                                                                      },
                                                                                                      {
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'name' => '0.7',
                                                                                                        'projectId' => 10565,
                                                                                                        'id' => '13696',
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13696',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                                      },
                                                                                                      {
                                                                                                        'id' => '13697',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13697',
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'projectId' => 10565,
                                                                                                        'name' => '0.9'
                                                                                                      },
                                                                                                      {
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13698',
                                                                                                        'id' => '13698',
                                                                                                        'projectId' => 10565,
                                                                                                        'name' => '6.6',
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                                      }
                                                                                                    ],
                                                                                 'operations' => [
                                                                                                   'set',
                                                                                                   'add',
                                                                                                   'remove'
                                                                                                 ],
                                                                                 'name' => 'Fix versions',
                                                                                 'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'key' => 'fixVersions',
                                                                                 'schema' => {
                                                                                               'type' => 'array',
                                                                                               'items' => 'version',
                                                                                               'system' => 'fixVersions'
                                                                                             }
                                                                               },
                                                              'customfield_10014' => {
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Epic Link',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'key' => 'customfield_10014',
                                                                                       'schema' => {
                                                                                                     'customId' => 10014,
                                                                                                     'custom' => 'com.pyxis.greenhopper.jira:gh-epic-link',
                                                                                                     'type' => 'any'
                                                                                                   },
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'customfield_10950' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'schema' => {
                                                                                                     'customId' => 10950,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:url',
                                                                                                     'type' => 'string'
                                                                                                   },
                                                                                       'key' => 'customfield_10950',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Craft link',
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                     },
                                                              'reporter' => {
                                                                              'autoCompleteUrl' => 'https://appgateinc.atlassian.net/rest/api/2/user/recommend?context=Reporter&issueKey=',
                                                                              'operations' => [
                                                                                                'set'
                                                                                              ],
                                                                              'name' => 'Reporter',
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                              'schema' => {
                                                                                            'type' => 'user',
                                                                                            'system' => 'reporter'
                                                                                          },
                                                                              'key' => 'reporter'
                                                                            },
                                                              'customfield_10752' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Original Creation Date',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'schema' => {
                                                                                                     'customId' => 10752,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:datepicker',
                                                                                                     'type' => 'date'
                                                                                                   },
                                                                                       'key' => 'customfield_10752'
                                                                                     }
                                                            },
                                                'expand' => 'fields',
                                                'description' => '',
                                                'subtask' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                'id' => '10951'
                                              },
                                              {
                                                'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/issuetype/avatar/10300?size=medium',
                                                'name' => 'Support Case',
                                                'hierarchyLevel' => 0,
                                                'untranslatedName' => 'Support Case',
                                                'self' => 'https://appgateinc.atlassian.net/rest/api/2/issuetype/10952',
                                                'fields' => {
                                                              'versions' => {
                                                                              'schema' => {
                                                                                            'type' => 'array',
                                                                                            'items' => 'version',
                                                                                            'system' => 'versions'
                                                                                          },
                                                                              'key' => 'versions',
                                                                              'name' => 'Affects versions',
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'allowedValues' => [
                                                                                                   {
                                                                                                     'id' => '13669',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13669',
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'name' => '0.8',
                                                                                                     'projectId' => 10565
                                                                                                   },
                                                                                                   {
                                                                                                     'id' => '13696',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13696',
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'name' => '0.7',
                                                                                                     'projectId' => 10565
                                                                                                   },
                                                                                                   {
                                                                                                     'id' => '13697',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13697',
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'name' => '0.9',
                                                                                                     'projectId' => 10565
                                                                                                   },
                                                                                                   {
                                                                                                     'id' => '13698',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13698',
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'projectId' => 10565,
                                                                                                     'name' => '6.6'
                                                                                                   }
                                                                                                 ],
                                                                              'operations' => [
                                                                                                'set',
                                                                                                'add',
                                                                                                'remove'
                                                                                              ]
                                                                            },
                                                              'components' => {
                                                                                'allowedValues' => [],
                                                                                'operations' => [
                                                                                                  'add',
                                                                                                  'set',
                                                                                                  'remove'
                                                                                                ],
                                                                                'name' => 'Components',
                                                                                'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'key' => 'components',
                                                                                'schema' => {
                                                                                              'system' => 'components',
                                                                                              'type' => 'array',
                                                                                              'items' => 'component'
                                                                                            }
                                                                              },
                                                              'description' => {
                                                                                 'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'name' => 'Description',
                                                                                 'schema' => {
                                                                                               'system' => 'description',
                                                                                               'type' => 'string'
                                                                                             },
                                                                                 'key' => 'description',
                                                                                 'operations' => [
                                                                                                   'set'
                                                                                                 ]
                                                                               },
                                                              'attachment' => {
                                                                                'operations' => [
                                                                                                  'set',
                                                                                                  'copy'
                                                                                                ],
                                                                                'key' => 'attachment',
                                                                                'schema' => {
                                                                                              'items' => 'attachment',
                                                                                              'type' => 'array',
                                                                                              'system' => 'attachment'
                                                                                            },
                                                                                'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'name' => 'Attachment'
                                                                              },
                                                              'customfield_10818' => {
                                                                                       'allowedValues' => [
                                                                                                            {
                                                                                                              'id' => '11345',
                                                                                                              'value' => 'No Impact',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11345'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11346',
                                                                                                              'id' => '11346',
                                                                                                              'value' => 'Docs Needs Update'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11347',
                                                                                                              'value' => 'Release Notes Needs Update',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11347'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11348',
                                                                                                              'id' => '11348',
                                                                                                              'value' => 'VPAT Needs Update'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Not reviewed',
                                                                                                              'id' => '11349',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11349'
                                                                                                            }
                                                                                                          ],
                                                                                       'schema' => {
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:multiselect',
                                                                                                     'customId' => 10818,
                                                                                                     'items' => 'option',
                                                                                                     'type' => 'array'
                                                                                                   },
                                                                                       'name' => 'ZTNA Impact',
                                                                                       'operations' => [
                                                                                                         'add',
                                                                                                         'set',
                                                                                                         'remove'
                                                                                                       ],
                                                                                       'key' => 'customfield_10818',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'defaultValue' => [
                                                                                                           {
                                                                                                             'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11349',
                                                                                                             'id' => '11349',
                                                                                                             'value' => 'Not reviewed'
                                                                                                           }
                                                                                                         ]
                                                                                     },
                                                              'labels' => {
                                                                            'operations' => [
                                                                                              'add',
                                                                                              'set',
                                                                                              'remove'
                                                                                            ],
                                                                            'autoCompleteUrl' => 'https://appgateinc.atlassian.net/rest/api/1.0/labels/suggest?query=',
                                                                            'key' => 'labels',
                                                                            'schema' => {
                                                                                          'items' => 'string',
                                                                                          'type' => 'array',
                                                                                          'system' => 'labels'
                                                                                        },
                                                                            'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'name' => 'Labels'
                                                                          },
                                                              'customfield_10851' => {
                                                                                       'allowedValues' => [
                                                                                                            {
                                                                                                              'value' => 'Advisor',
                                                                                                              'id' => '11351',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11351'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11352',
                                                                                                              'value' => 'Aitorbot',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11352'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Appliance',
                                                                                                              'id' => '11353',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11353'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Arc (Container)',
                                                                                                              'id' => '11354',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11354'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'CI/CD',
                                                                                                              'id' => '11355',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11355'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Clean Pipe',
                                                                                                              'id' => '11356',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11356'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11357',
                                                                                                              'id' => '11357',
                                                                                                              'value' => 'Client'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11478',
                                                                                                              'id' => '11478',
                                                                                                              'value' => 'Controller'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11358',
                                                                                                              'value' => 'Connector',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11358'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11359',
                                                                                                              'id' => '11359',
                                                                                                              'value' => 'DevOps'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11360',
                                                                                                              'value' => 'Envy',
                                                                                                              'id' => '11360'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11361',
                                                                                                              'id' => '11361',
                                                                                                              'value' => 'Frontend'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11362',
                                                                                                              'value' => 'Gateway',
                                                                                                              'id' => '11362'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11363',
                                                                                                              'value' => 'Helvetest',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11363'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11364',
                                                                                                              'id' => '11364',
                                                                                                              'value' => 'Injector'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11365',
                                                                                                              'id' => '11365',
                                                                                                              'value' => 'LogServer & Forwarder'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11366',
                                                                                                              'value' => 'Manual ',
                                                                                                              'id' => '11366'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Metrics',
                                                                                                              'id' => '11367',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11367'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11368',
                                                                                                              'id' => '11368',
                                                                                                              'value' => 'Operator'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11369',
                                                                                                              'id' => '11369',
                                                                                                              'value' => 'Portal'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Other',
                                                                                                              'id' => '11350',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11350'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11370',
                                                                                                              'value' => 'SDK',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11370'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11371',
                                                                                                              'value' => 'SDPCTL',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11371'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11372',
                                                                                                              'value' => 'Terraform Provider',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11372'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Test',
                                                                                                              'id' => '11477',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11477'
                                                                                                            }
                                                                                                          ],
                                                                                       'schema' => {
                                                                                                     'customId' => 10851,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:select',
                                                                                                     'type' => 'option'
                                                                                                   },
                                                                                       'name' => 'ZTNA Subsystem',
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'key' => 'customfield_10851',
                                                                                       'defaultValue' => {
                                                                                                           'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11350',
                                                                                                           'value' => 'Other',
                                                                                                           'id' => '11350'
                                                                                                         },
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'}
                                                                                     },
                                                              'issuetype' => {
                                                                               'allowedValues' => [
                                                                                                    {
                                                                                                      'self' => 'https://appgateinc.atlassian.net/rest/api/2/issuetype/10952',
                                                                                                      'hierarchyLevel' => 0,
                                                                                                      'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/issuetype/avatar/10300?size=medium',
                                                                                                      'avatarId' => 10300,
                                                                                                      'name' => 'Support Case',
                                                                                                      'description' => '',
                                                                                                      'id' => '10952',
                                                                                                      'subtask' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                                    }
                                                                                                  ],
                                                                               'operations' => [],
                                                                               'name' => 'Issue Type',
                                                                               'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                               'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                               'key' => 'issuetype',
                                                                               'schema' => {
                                                                                             'system' => 'issuetype',
                                                                                             'type' => 'issuetype'
                                                                                           }
                                                                             },
                                                              'duedate' => {
                                                                             'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'name' => 'Due date',
                                                                             'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'key' => 'duedate',
                                                                             'schema' => {
                                                                                           'type' => 'date',
                                                                                           'system' => 'duedate'
                                                                                         },
                                                                             'operations' => [
                                                                                               'set'
                                                                                             ]
                                                                           },
                                                              'parent' => {
                                                                            'name' => 'Parent',
                                                                            'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'key' => 'parent',
                                                                            'schema' => {
                                                                                          'system' => 'parent',
                                                                                          'type' => 'issuelink'
                                                                                        },
                                                                            'operations' => [
                                                                                              'set'
                                                                                            ]
                                                                          },
                                                              'assignee' => {
                                                                              'key' => 'assignee',
                                                                              'schema' => {
                                                                                            'system' => 'assignee',
                                                                                            'type' => 'user'
                                                                                          },
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'name' => 'Assignee',
                                                                              'operations' => [
                                                                                                'set'
                                                                                              ],
                                                                              'autoCompleteUrl' => 'https://appgateinc.atlassian.net/rest/api/2/user/assignable/search?project=ZT27&query='
                                                                            },
                                                              'customfield_11016' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'schema' => {
                                                                                                     'type' => 'string',
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:textarea',
                                                                                                     'customId' => 11016
                                                                                                   },
                                                                                       'key' => 'customfield_11016',
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Release note'
                                                                                     },
                                                              'customfield_10028' => {
                                                                                       'name' => 'Story Points',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'key' => 'customfield_10028',
                                                                                       'schema' => {
                                                                                                     'type' => 'number',
                                                                                                     'customId' => 10028,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:float'
                                                                                                   },
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'project' => {
                                                                             'operations' => [
                                                                                               'set'
                                                                                             ],
                                                                             'allowedValues' => [
                                                                                                  {
                                                                                                    'self' => 'https://appgateinc.atlassian.net/rest/api/2/project/10565',
                                                                                                    'avatarUrls' => {
                                                                                                                      '24x24' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=small',
                                                                                                                      '32x32' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=medium',
                                                                                                                      '48x48' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402',
                                                                                                                      '16x16' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=xsmall'
                                                                                                                    },
                                                                                                    'simplified' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                    'name' => 'ZTNA - Test 27',
                                                                                                    'id' => '10565',
                                                                                                    'projectCategory' => {
                                                                                                                           'name' => 'ZTNA',
                                                                                                                           'self' => 'https://appgateinc.atlassian.net/rest/api/2/projectCategory/10013',
                                                                                                                           'description' => 'ZTNA Projects',
                                                                                                                           'id' => '10013'
                                                                                                                         },
                                                                                                    'projectTypeKey' => 'software',
                                                                                                    'key' => 'ZT27'
                                                                                                  }
                                                                                                ],
                                                                             'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                             'name' => 'Project',
                                                                             'schema' => {
                                                                                           'type' => 'project',
                                                                                           'system' => 'project'
                                                                                         },
                                                                             'key' => 'project'
                                                                           },
                                                              'customfield_10020' => {
                                                                                       'key' => 'customfield_10020',
                                                                                       'schema' => {
                                                                                                     'customId' => 10020,
                                                                                                     'custom' => 'com.pyxis.greenhopper.jira:gh-sprint',
                                                                                                     'type' => 'array',
                                                                                                     'items' => 'json'
                                                                                                   },
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Sprint',
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'timetracking' => {
                                                                                  'schema' => {
                                                                                                'type' => 'timetracking',
                                                                                                'system' => 'timetracking'
                                                                                              },
                                                                                  'key' => 'timetracking',
                                                                                  'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                  'name' => 'Time tracking',
                                                                                  'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                  'operations' => [
                                                                                                    'set',
                                                                                                    'edit'
                                                                                                  ]
                                                                                },
                                                              'summary' => {
                                                                             'operations' => [
                                                                                               'set'
                                                                                             ],
                                                                             'key' => 'summary',
                                                                             'schema' => {
                                                                                           'system' => 'summary',
                                                                                           'type' => 'string'
                                                                                         },
                                                                             'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'name' => 'Summary',
                                                                             'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'}
                                                                           },
                                                              'customfield_10720' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'key' => 'customfield_10720',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'defaultValue' => {
                                                                                                           'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11253',
                                                                                                           'id' => '11253',
                                                                                                           'value' => 'No Team'
                                                                                                         },
                                                                                       'allowedValues' => [
                                                                                                            {
                                                                                                              'id' => '11253',
                                                                                                              'value' => 'No Team',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11253'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11254',
                                                                                                              'id' => '11254',
                                                                                                              'value' => 'Core'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11255',
                                                                                                              'value' => 'Data Plane',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11255'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11256',
                                                                                                              'value' => 'Integrations',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11256'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11257',
                                                                                                              'value' => 'Platform',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11257'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11258',
                                                                                                              'id' => '11258',
                                                                                                              'value' => 'UI'
                                                                                                            }
                                                                                                          ],
                                                                                       'schema' => {
                                                                                                     'customId' => 10720,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:select',
                                                                                                     'type' => 'option'
                                                                                                   },
                                                                                       'name' => 'ZTNA Team'
                                                                                     },
                                                              'fixVersions' => {
                                                                                 'allowedValues' => [
                                                                                                      {
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'projectId' => 10565,
                                                                                                        'name' => '0.8',
                                                                                                        'id' => '13669',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13669'
                                                                                                      },
                                                                                                      {
                                                                                                        'id' => '13696',
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13696',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'name' => '0.7',
                                                                                                        'projectId' => 10565
                                                                                                      },
                                                                                                      {
                                                                                                        'name' => '0.9',
                                                                                                        'projectId' => 10565,
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13697',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'id' => '13697'
                                                                                                      },
                                                                                                      {
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'name' => '6.6',
                                                                                                        'projectId' => 10565,
                                                                                                        'id' => '13698',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13698'
                                                                                                      }
                                                                                                    ],
                                                                                 'operations' => [
                                                                                                   'set',
                                                                                                   'add',
                                                                                                   'remove'
                                                                                                 ],
                                                                                 'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'name' => 'Fix versions',
                                                                                 'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'schema' => {
                                                                                               'items' => 'version',
                                                                                               'type' => 'array',
                                                                                               'system' => 'fixVersions'
                                                                                             },
                                                                                 'key' => 'fixVersions'
                                                                               },
                                                              'customfield_10983' => {
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Original estimate',
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'key' => 'customfield_10983',
                                                                                       'schema' => {
                                                                                                     'customId' => 10983,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:float',
                                                                                                     'type' => 'number'
                                                                                                   },
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'priority' => {
                                                                              'allowedValues' => [
                                                                                                   {
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10674?size=medium',
                                                                                                     'name' => '500',
                                                                                                     'avatarId' => 10674,
                                                                                                     'id' => '10010',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10010'
                                                                                                   },
                                                                                                   {
                                                                                                     'avatarId' => 10677,
                                                                                                     'name' => '400',
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10677?size=medium',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10011',
                                                                                                     'id' => '10011'
                                                                                                   },
                                                                                                   {
                                                                                                     'avatarId' => 10672,
                                                                                                     'name' => '300',
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10672?size=medium',
                                                                                                     'id' => '10012',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10012'
                                                                                                   },
                                                                                                   {
                                                                                                     'id' => '10013',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10013',
                                                                                                     'name' => '200',
                                                                                                     'avatarId' => 10679,
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10679?size=medium'
                                                                                                   },
                                                                                                   {
                                                                                                     'avatarId' => 10673,
                                                                                                     'name' => '100',
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10673?size=medium',
                                                                                                     'id' => '10014',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10014'
                                                                                                   }
                                                                                                 ],
                                                                              'schema' => {
                                                                                            'type' => 'priority',
                                                                                            'system' => 'priority'
                                                                                          },
                                                                              'name' => 'Priority',
                                                                              'operations' => [
                                                                                                'set'
                                                                                              ],
                                                                              'key' => 'priority',
                                                                              'defaultValue' => {
                                                                                                  'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10013',
                                                                                                  'id' => '10013',
                                                                                                  'avatarId' => 10679,
                                                                                                  'name' => '200',
                                                                                                  'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10679?size=medium'
                                                                                                },
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                            },
                                                              'reporter' => {
                                                                              'autoCompleteUrl' => 'https://appgateinc.atlassian.net/rest/api/2/user/recommend?context=Reporter&issueKey=',
                                                                              'operations' => [
                                                                                                'set'
                                                                                              ],
                                                                              'name' => 'Reporter',
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                              'key' => 'reporter',
                                                                              'schema' => {
                                                                                            'type' => 'user',
                                                                                            'system' => 'reporter'
                                                                                          }
                                                                            },
                                                              'customfield_10752' => {
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Original Creation Date',
                                                                                       'schema' => {
                                                                                                     'type' => 'date',
                                                                                                     'customId' => 10752,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:datepicker'
                                                                                                   },
                                                                                       'key' => 'customfield_10752',
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'customfield_10014' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'key' => 'customfield_10014',
                                                                                       'schema' => {
                                                                                                     'type' => 'any',
                                                                                                     'customId' => 10014,
                                                                                                     'custom' => 'com.pyxis.greenhopper.jira:gh-epic-link'
                                                                                                   },
                                                                                       'name' => 'Epic Link',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                     },
                                                              'customfield_10950' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'key' => 'customfield_10950',
                                                                                       'schema' => {
                                                                                                     'type' => 'string',
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:url',
                                                                                                     'customId' => 10950
                                                                                                   },
                                                                                       'name' => 'Craft link',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                     }
                                                            },
                                                'expand' => 'fields',
                                                'id' => '10952',
                                                'subtask' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                'description' => ''
                                              },
                                              {
                                                'expand' => 'fields',
                                                'fields' => {
                                                              'duedate' => {
                                                                             'operations' => [
                                                                                               'set'
                                                                                             ],
                                                                             'schema' => {
                                                                                           'type' => 'date',
                                                                                           'system' => 'duedate'
                                                                                         },
                                                                             'key' => 'duedate',
                                                                             'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'name' => 'Due date',
                                                                             'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                           },
                                                              'parent' => {
                                                                            'operations' => [
                                                                                              'set'
                                                                                            ],
                                                                            'name' => 'Parent',
                                                                            'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'schema' => {
                                                                                          'system' => 'parent',
                                                                                          'type' => 'issuelink'
                                                                                        },
                                                                            'key' => 'parent'
                                                                          },
                                                              'customfield_11016' => {
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Release note',
                                                                                       'schema' => {
                                                                                                     'type' => 'string',
                                                                                                     'customId' => 11016,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:textarea'
                                                                                                   },
                                                                                       'key' => 'customfield_11016',
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'assignee' => {
                                                                              'autoCompleteUrl' => 'https://appgateinc.atlassian.net/rest/api/2/user/assignable/search?project=ZT27&query=',
                                                                              'operations' => [
                                                                                                'set'
                                                                                              ],
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'name' => 'Assignee',
                                                                              'schema' => {
                                                                                            'system' => 'assignee',
                                                                                            'type' => 'user'
                                                                                          },
                                                                              'key' => 'assignee'
                                                                            },
                                                              'customfield_10028' => {
                                                                                       'schema' => {
                                                                                                     'type' => 'number',
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:float',
                                                                                                     'customId' => 10028
                                                                                                   },
                                                                                       'key' => 'customfield_10028',
                                                                                       'name' => 'Story Points',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'project' => {
                                                                             'schema' => {
                                                                                           'system' => 'project',
                                                                                           'type' => 'project'
                                                                                         },
                                                                             'key' => 'project',
                                                                             'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'name' => 'Project',
                                                                             'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                             'operations' => [
                                                                                               'set'
                                                                                             ],
                                                                             'allowedValues' => [
                                                                                                  {
                                                                                                    'simplified' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                    'avatarUrls' => {
                                                                                                                      '24x24' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=small',
                                                                                                                      '32x32' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=medium',
                                                                                                                      '16x16' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=xsmall',
                                                                                                                      '48x48' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402'
                                                                                                                    },
                                                                                                    'self' => 'https://appgateinc.atlassian.net/rest/api/2/project/10565',
                                                                                                    'name' => 'ZTNA - Test 27',
                                                                                                    'id' => '10565',
                                                                                                    'key' => 'ZT27',
                                                                                                    'projectTypeKey' => 'software',
                                                                                                    'projectCategory' => {
                                                                                                                           'name' => 'ZTNA',
                                                                                                                           'id' => '10013',
                                                                                                                           'self' => 'https://appgateinc.atlassian.net/rest/api/2/projectCategory/10013',
                                                                                                                           'description' => 'ZTNA Projects'
                                                                                                                         }
                                                                                                  }
                                                                                                ]
                                                                           },
                                                              'versions' => {
                                                                              'allowedValues' => [
                                                                                                   {
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13669',
                                                                                                     'id' => '13669',
                                                                                                     'name' => '0.8',
                                                                                                     'projectId' => 10565,
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                                   },
                                                                                                   {
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13696',
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'id' => '13696',
                                                                                                     'name' => '0.7',
                                                                                                     'projectId' => 10565,
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                                   },
                                                                                                   {
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13697',
                                                                                                     'id' => '13697',
                                                                                                     'projectId' => 10565,
                                                                                                     'name' => '0.9',
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                                   },
                                                                                                   {
                                                                                                     'id' => '13698',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13698',
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'projectId' => 10565,
                                                                                                     'name' => '6.6'
                                                                                                   }
                                                                                                 ],
                                                                              'operations' => [
                                                                                                'set',
                                                                                                'add',
                                                                                                'remove'
                                                                                              ],
                                                                              'schema' => {
                                                                                            'system' => 'versions',
                                                                                            'type' => 'array',
                                                                                            'items' => 'version'
                                                                                          },
                                                                              'key' => 'versions',
                                                                              'name' => 'Affects versions',
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                            },
                                                              'components' => {
                                                                                'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'name' => 'Components',
                                                                                'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'schema' => {
                                                                                              'system' => 'components',
                                                                                              'items' => 'component',
                                                                                              'type' => 'array'
                                                                                            },
                                                                                'key' => 'components',
                                                                                'operations' => [
                                                                                                  'add',
                                                                                                  'set',
                                                                                                  'remove'
                                                                                                ],
                                                                                'allowedValues' => []
                                                                              },
                                                              'customfield_10818' => {
                                                                                       'name' => 'ZTNA Impact',
                                                                                       'schema' => {
                                                                                                     'customId' => 10818,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:multiselect',
                                                                                                     'type' => 'array',
                                                                                                     'items' => 'option'
                                                                                                   },
                                                                                       'allowedValues' => [
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11345',
                                                                                                              'id' => '11345',
                                                                                                              'value' => 'No Impact'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11346',
                                                                                                              'id' => '11346',
                                                                                                              'value' => 'Docs Needs Update'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11347',
                                                                                                              'value' => 'Release Notes Needs Update',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11347'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11348',
                                                                                                              'value' => 'VPAT Needs Update',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11348'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11349',
                                                                                                              'value' => 'Not reviewed',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11349'
                                                                                                            }
                                                                                                          ],
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'defaultValue' => [
                                                                                                           {
                                                                                                             'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11349',
                                                                                                             'value' => 'Not reviewed',
                                                                                                             'id' => '11349'
                                                                                                           }
                                                                                                         ],
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'key' => 'customfield_10818',
                                                                                       'operations' => [
                                                                                                         'add',
                                                                                                         'set',
                                                                                                         'remove'
                                                                                                       ]
                                                                                     },
                                                              'description' => {
                                                                                 'operations' => [
                                                                                                   'set'
                                                                                                 ],
                                                                                 'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'name' => 'Description',
                                                                                 'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'key' => 'description',
                                                                                 'schema' => {
                                                                                               'type' => 'string',
                                                                                               'system' => 'description'
                                                                                             }
                                                                               },
                                                              'attachment' => {
                                                                                'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'name' => 'Attachment',
                                                                                'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'schema' => {
                                                                                              'system' => 'attachment',
                                                                                              'items' => 'attachment',
                                                                                              'type' => 'array'
                                                                                            },
                                                                                'key' => 'attachment',
                                                                                'operations' => [
                                                                                                  'set',
                                                                                                  'copy'
                                                                                                ]
                                                                              },
                                                              'customfield_10851' => {
                                                                                       'defaultValue' => {
                                                                                                           'id' => '11350',
                                                                                                           'value' => 'Other',
                                                                                                           'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11350'
                                                                                                         },
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'key' => 'customfield_10851',
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'name' => 'ZTNA Subsystem',
                                                                                       'schema' => {
                                                                                                     'type' => 'option',
                                                                                                     'customId' => 10851,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:select'
                                                                                                   },
                                                                                       'allowedValues' => [
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11351',
                                                                                                              'value' => 'Advisor',
                                                                                                              'id' => '11351'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11352',
                                                                                                              'id' => '11352',
                                                                                                              'value' => 'Aitorbot'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11353',
                                                                                                              'value' => 'Appliance',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11353'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Arc (Container)',
                                                                                                              'id' => '11354',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11354'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11355',
                                                                                                              'value' => 'CI/CD',
                                                                                                              'id' => '11355'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11356',
                                                                                                              'value' => 'Clean Pipe',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11356'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11357',
                                                                                                              'value' => 'Client',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11357'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11478',
                                                                                                              'value' => 'Controller',
                                                                                                              'id' => '11478'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11358',
                                                                                                              'value' => 'Connector',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11358'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11359',
                                                                                                              'value' => 'DevOps',
                                                                                                              'id' => '11359'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Envy',
                                                                                                              'id' => '11360',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11360'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Frontend',
                                                                                                              'id' => '11361',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11361'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11362',
                                                                                                              'value' => 'Gateway',
                                                                                                              'id' => '11362'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Helvetest',
                                                                                                              'id' => '11363',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11363'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11364',
                                                                                                              'value' => 'Injector',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11364'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'LogServer & Forwarder',
                                                                                                              'id' => '11365',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11365'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11366',
                                                                                                              'value' => 'Manual ',
                                                                                                              'id' => '11366'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Metrics',
                                                                                                              'id' => '11367',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11367'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Operator',
                                                                                                              'id' => '11368',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11368'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11369',
                                                                                                              'value' => 'Portal',
                                                                                                              'id' => '11369'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11350',
                                                                                                              'value' => 'Other',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11350'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11370',
                                                                                                              'value' => 'SDK',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11370'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11371',
                                                                                                              'value' => 'SDPCTL',
                                                                                                              'id' => '11371'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Terraform Provider',
                                                                                                              'id' => '11372',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11372'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11477',
                                                                                                              'value' => 'Test',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11477'
                                                                                                            }
                                                                                                          ]
                                                                                     },
                                                              'labels' => {
                                                                            'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'name' => 'Labels',
                                                                            'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'schema' => {
                                                                                          'items' => 'string',
                                                                                          'type' => 'array',
                                                                                          'system' => 'labels'
                                                                                        },
                                                                            'key' => 'labels',
                                                                            'autoCompleteUrl' => 'https://appgateinc.atlassian.net/rest/api/1.0/labels/suggest?query=',
                                                                            'operations' => [
                                                                                              'add',
                                                                                              'set',
                                                                                              'remove'
                                                                                            ]
                                                                          },
                                                              'issuetype' => {
                                                                               'operations' => [],
                                                                               'allowedValues' => [
                                                                                                    {
                                                                                                      'subtask' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                      'id' => '10025',
                                                                                                      'description' => 'Mobile documentation task (Migrated on 19 Nov 2020 21:23 UTC)',
                                                                                                      'avatarId' => 10306,
                                                                                                      'name' => 'Documentation',
                                                                                                      'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/issuetype/avatar/10306?size=medium',
                                                                                                      'hierarchyLevel' => 0,
                                                                                                      'self' => 'https://appgateinc.atlassian.net/rest/api/2/issuetype/10025'
                                                                                                    }
                                                                                                  ],
                                                                               'schema' => {
                                                                                             'system' => 'issuetype',
                                                                                             'type' => 'issuetype'
                                                                                           },
                                                                               'key' => 'issuetype',
                                                                               'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                               'name' => 'Issue Type',
                                                                               'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'}
                                                                             },
                                                              'reporter' => {
                                                                              'operations' => [
                                                                                                'set'
                                                                                              ],
                                                                              'autoCompleteUrl' => 'https://appgateinc.atlassian.net/rest/api/2/user/recommend?context=Reporter&issueKey=',
                                                                              'key' => 'reporter',
                                                                              'schema' => {
                                                                                            'type' => 'user',
                                                                                            'system' => 'reporter'
                                                                                          },
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                              'name' => 'Reporter'
                                                                            },
                                                              'customfield_10752' => {
                                                                                       'schema' => {
                                                                                                     'type' => 'date',
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:datepicker',
                                                                                                     'customId' => 10752
                                                                                                   },
                                                                                       'key' => 'customfield_10752',
                                                                                       'name' => 'Original Creation Date',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'customfield_10014' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Epic Link',
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'schema' => {
                                                                                                     'customId' => 10014,
                                                                                                     'custom' => 'com.pyxis.greenhopper.jira:gh-epic-link',
                                                                                                     'type' => 'any'
                                                                                                   },
                                                                                       'key' => 'customfield_10014'
                                                                                     },
                                                              'customfield_10950' => {
                                                                                       'schema' => {
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:url',
                                                                                                     'customId' => 10950,
                                                                                                     'type' => 'string'
                                                                                                   },
                                                                                       'key' => 'customfield_10950',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Craft link',
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'timetracking' => {
                                                                                  'operations' => [
                                                                                                    'set',
                                                                                                    'edit'
                                                                                                  ],
                                                                                  'name' => 'Time tracking',
                                                                                  'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                  'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                  'schema' => {
                                                                                                'type' => 'timetracking',
                                                                                                'system' => 'timetracking'
                                                                                              },
                                                                                  'key' => 'timetracking'
                                                                                },
                                                              'summary' => {
                                                                             'schema' => {
                                                                                           'system' => 'summary',
                                                                                           'type' => 'string'
                                                                                         },
                                                                             'key' => 'summary',
                                                                             'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                             'name' => 'Summary',
                                                                             'operations' => [
                                                                                               'set'
                                                                                             ]
                                                                           },
                                                              'customfield_10020' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Sprint',
                                                                                       'key' => 'customfield_10020',
                                                                                       'schema' => {
                                                                                                     'customId' => 10020,
                                                                                                     'custom' => 'com.pyxis.greenhopper.jira:gh-sprint',
                                                                                                     'type' => 'array',
                                                                                                     'items' => 'json'
                                                                                                   }
                                                                                     },
                                                              'fixVersions' => {
                                                                                 'allowedValues' => [
                                                                                                      {
                                                                                                        'id' => '13669',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13669',
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'name' => '0.8',
                                                                                                        'projectId' => 10565
                                                                                                      },
                                                                                                      {
                                                                                                        'id' => '13696',
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13696',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'name' => '0.7',
                                                                                                        'projectId' => 10565
                                                                                                      },
                                                                                                      {
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'projectId' => 10565,
                                                                                                        'name' => '0.9',
                                                                                                        'id' => '13697',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13697'
                                                                                                      },
                                                                                                      {
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'name' => '6.6',
                                                                                                        'projectId' => 10565,
                                                                                                        'id' => '13698',
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13698',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                                      }
                                                                                                    ],
                                                                                 'operations' => [
                                                                                                   'set',
                                                                                                   'add',
                                                                                                   'remove'
                                                                                                 ],
                                                                                 'name' => 'Fix versions',
                                                                                 'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'schema' => {
                                                                                               'system' => 'fixVersions',
                                                                                               'type' => 'array',
                                                                                               'items' => 'version'
                                                                                             },
                                                                                 'key' => 'fixVersions'
                                                                               },
                                                              'customfield_10720' => {
                                                                                       'key' => 'customfield_10720',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'defaultValue' => {
                                                                                                           'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11253',
                                                                                                           'id' => '11253',
                                                                                                           'value' => 'No Team'
                                                                                                         },
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'schema' => {
                                                                                                     'type' => 'option',
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:select',
                                                                                                     'customId' => 10720
                                                                                                   },
                                                                                       'name' => 'ZTNA Team',
                                                                                       'allowedValues' => [
                                                                                                            {
                                                                                                              'id' => '11253',
                                                                                                              'value' => 'No Team',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11253'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Core',
                                                                                                              'id' => '11254',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11254'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11255',
                                                                                                              'value' => 'Data Plane',
                                                                                                              'id' => '11255'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Integrations',
                                                                                                              'id' => '11256',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11256'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11257',
                                                                                                              'id' => '11257',
                                                                                                              'value' => 'Platform'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'UI',
                                                                                                              'id' => '11258',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11258'
                                                                                                            }
                                                                                                          ]
                                                                                     },
                                                              'customfield_10983' => {
                                                                                       'schema' => {
                                                                                                     'type' => 'number',
                                                                                                     'customId' => 10983,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:float'
                                                                                                   },
                                                                                       'key' => 'customfield_10983',
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Original estimate',
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'priority' => {
                                                                              'key' => 'priority',
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                              'defaultValue' => {
                                                                                                  'name' => '200',
                                                                                                  'avatarId' => 10679,
                                                                                                  'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10679?size=medium',
                                                                                                  'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10013',
                                                                                                  'id' => '10013'
                                                                                                },
                                                                              'operations' => [
                                                                                                'set'
                                                                                              ],
                                                                              'schema' => {
                                                                                            'system' => 'priority',
                                                                                            'type' => 'priority'
                                                                                          },
                                                                              'name' => 'Priority',
                                                                              'allowedValues' => [
                                                                                                   {
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10010',
                                                                                                     'id' => '10010',
                                                                                                     'avatarId' => 10674,
                                                                                                     'name' => '500',
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10674?size=medium'
                                                                                                   },
                                                                                                   {
                                                                                                     'name' => '400',
                                                                                                     'avatarId' => 10677,
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10677?size=medium',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10011',
                                                                                                     'id' => '10011'
                                                                                                   },
                                                                                                   {
                                                                                                     'avatarId' => 10672,
                                                                                                     'name' => '300',
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10672?size=medium',
                                                                                                     'id' => '10012',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10012'
                                                                                                   },
                                                                                                   {
                                                                                                     'name' => '200',
                                                                                                     'avatarId' => 10679,
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10679?size=medium',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10013',
                                                                                                     'id' => '10013'
                                                                                                   },
                                                                                                   {
                                                                                                     'id' => '10014',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10014',
                                                                                                     'name' => '100',
                                                                                                     'avatarId' => 10673,
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10673?size=medium'
                                                                                                   }
                                                                                                 ]
                                                                            }
                                                            },
                                                'description' => 'Mobile documentation task (Migrated on 19 Nov 2020 21:23 UTC)',
                                                'id' => '10025',
                                                'subtask' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/issuetype/avatar/10306?size=medium',
                                                'name' => 'Documentation',
                                                'self' => 'https://appgateinc.atlassian.net/rest/api/2/issuetype/10025',
                                                'hierarchyLevel' => 0,
                                                'untranslatedName' => 'Documentation'
                                              },
                                              {
                                                'name' => 'Feature Request',
                                                'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/issuetype/avatar/10300?size=medium',
                                                'self' => 'https://appgateinc.atlassian.net/rest/api/2/issuetype/10953',
                                                'untranslatedName' => 'Feature Request',
                                                'hierarchyLevel' => 0,
                                                'expand' => 'fields',
                                                'fields' => {
                                                              'priority' => {
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'defaultValue' => {
                                                                                                  'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10679?size=medium',
                                                                                                  'name' => '200',
                                                                                                  'avatarId' => 10679,
                                                                                                  'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10013',
                                                                                                  'id' => '10013'
                                                                                                },
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                              'key' => 'priority',
                                                                              'operations' => [
                                                                                                'set'
                                                                                              ],
                                                                              'name' => 'Priority',
                                                                              'schema' => {
                                                                                            'system' => 'priority',
                                                                                            'type' => 'priority'
                                                                                          },
                                                                              'allowedValues' => [
                                                                                                   {
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10674?size=medium',
                                                                                                     'avatarId' => 10674,
                                                                                                     'name' => '500',
                                                                                                     'id' => '10010',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10010'
                                                                                                   },
                                                                                                   {
                                                                                                     'id' => '10011',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10011',
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10677?size=medium',
                                                                                                     'name' => '400',
                                                                                                     'avatarId' => 10677
                                                                                                   },
                                                                                                   {
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10672?size=medium',
                                                                                                     'name' => '300',
                                                                                                     'avatarId' => 10672,
                                                                                                     'id' => '10012',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10012'
                                                                                                   },
                                                                                                   {
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10013',
                                                                                                     'id' => '10013',
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10679?size=medium',
                                                                                                     'name' => '200',
                                                                                                     'avatarId' => 10679
                                                                                                   },
                                                                                                   {
                                                                                                     'avatarId' => 10673,
                                                                                                     'name' => '100',
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10673?size=medium',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10014',
                                                                                                     'id' => '10014'
                                                                                                   }
                                                                                                 ]
                                                                            },
                                                              'customfield_10983' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'key' => 'customfield_10983',
                                                                                       'schema' => {
                                                                                                     'type' => 'number',
                                                                                                     'customId' => 10983,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:float'
                                                                                                   },
                                                                                       'name' => 'Original estimate',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                     },
                                                              'fixVersions' => {
                                                                                 'key' => 'fixVersions',
                                                                                 'schema' => {
                                                                                               'items' => 'version',
                                                                                               'type' => 'array',
                                                                                               'system' => 'fixVersions'
                                                                                             },
                                                                                 'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'name' => 'Fix versions',
                                                                                 'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'operations' => [
                                                                                                   'set',
                                                                                                   'add',
                                                                                                   'remove'
                                                                                                 ],
                                                                                 'allowedValues' => [
                                                                                                      {
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'name' => '0.8',
                                                                                                        'projectId' => 10565,
                                                                                                        'id' => '13669',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13669'
                                                                                                      },
                                                                                                      {
                                                                                                        'id' => '13696',
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13696',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'projectId' => 10565,
                                                                                                        'name' => '0.7'
                                                                                                      },
                                                                                                      {
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'name' => '0.9',
                                                                                                        'projectId' => 10565,
                                                                                                        'id' => '13697',
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13697',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                                      },
                                                                                                      {
                                                                                                        'id' => '13698',
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13698',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'projectId' => 10565,
                                                                                                        'name' => '6.6'
                                                                                                      }
                                                                                                    ]
                                                                               },
                                                              'customfield_10720' => {
                                                                                       'key' => 'customfield_10720',
                                                                                       'defaultValue' => {
                                                                                                           'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11253',
                                                                                                           'value' => 'No Team',
                                                                                                           'id' => '11253'
                                                                                                         },
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'schema' => {
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:select',
                                                                                                     'customId' => 10720,
                                                                                                     'type' => 'option'
                                                                                                   },
                                                                                       'name' => 'ZTNA Team',
                                                                                       'allowedValues' => [
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11253',
                                                                                                              'id' => '11253',
                                                                                                              'value' => 'No Team'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11254',
                                                                                                              'value' => 'Core',
                                                                                                              'id' => '11254'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11255',
                                                                                                              'value' => 'Data Plane',
                                                                                                              'id' => '11255'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11256',
                                                                                                              'value' => 'Integrations',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11256'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Platform',
                                                                                                              'id' => '11257',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11257'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'UI',
                                                                                                              'id' => '11258',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11258'
                                                                                                            }
                                                                                                          ]
                                                                                     },
                                                              'summary' => {
                                                                             'name' => 'Summary',
                                                                             'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                             'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'key' => 'summary',
                                                                             'schema' => {
                                                                                           'type' => 'string',
                                                                                           'system' => 'summary'
                                                                                         },
                                                                             'operations' => [
                                                                                               'set'
                                                                                             ]
                                                                           },
                                                              'timetracking' => {
                                                                                  'operations' => [
                                                                                                    'set',
                                                                                                    'edit'
                                                                                                  ],
                                                                                  'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                  'name' => 'Time tracking',
                                                                                  'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                  'key' => 'timetracking',
                                                                                  'schema' => {
                                                                                                'system' => 'timetracking',
                                                                                                'type' => 'timetracking'
                                                                                              }
                                                                                },
                                                              'customfield_10020' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Sprint',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'key' => 'customfield_10020',
                                                                                       'schema' => {
                                                                                                     'customId' => 10020,
                                                                                                     'custom' => 'com.pyxis.greenhopper.jira:gh-sprint',
                                                                                                     'type' => 'array',
                                                                                                     'items' => 'json'
                                                                                                   }
                                                                                     },
                                                              'customfield_10950' => {
                                                                                       'schema' => {
                                                                                                     'type' => 'string',
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:url',
                                                                                                     'customId' => 10950
                                                                                                   },
                                                                                       'key' => 'customfield_10950',
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Craft link',
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'customfield_10014' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Epic Link',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'schema' => {
                                                                                                     'type' => 'any',
                                                                                                     'customId' => 10014,
                                                                                                     'custom' => 'com.pyxis.greenhopper.jira:gh-epic-link'
                                                                                                   },
                                                                                       'key' => 'customfield_10014'
                                                                                     },
                                                              'reporter' => {
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                              'name' => 'Reporter',
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                              'key' => 'reporter',
                                                                              'schema' => {
                                                                                            'system' => 'reporter',
                                                                                            'type' => 'user'
                                                                                          },
                                                                              'autoCompleteUrl' => 'https://appgateinc.atlassian.net/rest/api/2/user/recommend?context=Reporter&issueKey=',
                                                                              'operations' => [
                                                                                                'set'
                                                                                              ]
                                                                            },
                                                              'customfield_10752' => {
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Original Creation Date',
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'schema' => {
                                                                                                     'customId' => 10752,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:datepicker',
                                                                                                     'type' => 'date'
                                                                                                   },
                                                                                       'key' => 'customfield_10752',
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'issuetype' => {
                                                                               'key' => 'issuetype',
                                                                               'schema' => {
                                                                                             'type' => 'issuetype',
                                                                                             'system' => 'issuetype'
                                                                                           },
                                                                               'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                               'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                               'name' => 'Issue Type',
                                                                               'operations' => [],
                                                                               'allowedValues' => [
                                                                                                    {
                                                                                                      'self' => 'https://appgateinc.atlassian.net/rest/api/2/issuetype/10953',
                                                                                                      'hierarchyLevel' => 0,
                                                                                                      'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/issuetype/avatar/10300?size=medium',
                                                                                                      'avatarId' => 10300,
                                                                                                      'name' => 'Feature Request',
                                                                                                      'description' => '',
                                                                                                      'id' => '10953',
                                                                                                      'subtask' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                                    }
                                                                                                  ]
                                                                             },
                                                              'customfield_10851' => {
                                                                                       'allowedValues' => [
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11351',
                                                                                                              'value' => 'Advisor',
                                                                                                              'id' => '11351'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Aitorbot',
                                                                                                              'id' => '11352',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11352'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11353',
                                                                                                              'id' => '11353',
                                                                                                              'value' => 'Appliance'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Arc (Container)',
                                                                                                              'id' => '11354',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11354'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11355',
                                                                                                              'value' => 'CI/CD',
                                                                                                              'id' => '11355'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Clean Pipe',
                                                                                                              'id' => '11356',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11356'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11357',
                                                                                                              'id' => '11357',
                                                                                                              'value' => 'Client'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11478',
                                                                                                              'value' => 'Controller',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11478'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11358',
                                                                                                              'value' => 'Connector',
                                                                                                              'id' => '11358'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11359',
                                                                                                              'id' => '11359',
                                                                                                              'value' => 'DevOps'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11360',
                                                                                                              'value' => 'Envy',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11360'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Frontend',
                                                                                                              'id' => '11361',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11361'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11362',
                                                                                                              'value' => 'Gateway',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11362'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Helvetest',
                                                                                                              'id' => '11363',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11363'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11364',
                                                                                                              'value' => 'Injector',
                                                                                                              'id' => '11364'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11365',
                                                                                                              'id' => '11365',
                                                                                                              'value' => 'LogServer & Forwarder'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11366',
                                                                                                              'value' => 'Manual ',
                                                                                                              'id' => '11366'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11367',
                                                                                                              'value' => 'Metrics',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11367'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11368',
                                                                                                              'value' => 'Operator',
                                                                                                              'id' => '11368'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11369',
                                                                                                              'value' => 'Portal',
                                                                                                              'id' => '11369'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11350',
                                                                                                              'value' => 'Other',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11350'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11370',
                                                                                                              'id' => '11370',
                                                                                                              'value' => 'SDK'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11371',
                                                                                                              'value' => 'SDPCTL',
                                                                                                              'id' => '11371'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11372',
                                                                                                              'value' => 'Terraform Provider',
                                                                                                              'id' => '11372'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11477',
                                                                                                              'value' => 'Test',
                                                                                                              'id' => '11477'
                                                                                                            }
                                                                                                          ],
                                                                                       'schema' => {
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:select',
                                                                                                     'customId' => 10851,
                                                                                                     'type' => 'option'
                                                                                                   },
                                                                                       'name' => 'ZTNA Subsystem',
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'key' => 'customfield_10851',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'defaultValue' => {
                                                                                                           'value' => 'Other',
                                                                                                           'id' => '11350',
                                                                                                           'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11350'
                                                                                                         },
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'}
                                                                                     },
                                                              'labels' => {
                                                                            'key' => 'labels',
                                                                            'schema' => {
                                                                                          'system' => 'labels',
                                                                                          'type' => 'array',
                                                                                          'items' => 'string'
                                                                                        },
                                                                            'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'name' => 'Labels',
                                                                            'operations' => [
                                                                                              'add',
                                                                                              'set',
                                                                                              'remove'
                                                                                            ],
                                                                            'autoCompleteUrl' => 'https://appgateinc.atlassian.net/rest/api/1.0/labels/suggest?query='
                                                                          },
                                                              'customfield_10818' => {
                                                                                       'allowedValues' => [
                                                                                                            {
                                                                                                              'id' => '11345',
                                                                                                              'value' => 'No Impact',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11345'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11346',
                                                                                                              'id' => '11346',
                                                                                                              'value' => 'Docs Needs Update'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Release Notes Needs Update',
                                                                                                              'id' => '11347',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11347'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'VPAT Needs Update',
                                                                                                              'id' => '11348',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11348'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11349',
                                                                                                              'value' => 'Not reviewed',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11349'
                                                                                                            }
                                                                                                          ],
                                                                                       'schema' => {
                                                                                                     'customId' => 10818,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:multiselect',
                                                                                                     'type' => 'array',
                                                                                                     'items' => 'option'
                                                                                                   },
                                                                                       'name' => 'ZTNA Impact',
                                                                                       'operations' => [
                                                                                                         'add',
                                                                                                         'set',
                                                                                                         'remove'
                                                                                                       ],
                                                                                       'key' => 'customfield_10818',
                                                                                       'defaultValue' => [
                                                                                                           {
                                                                                                             'id' => '11349',
                                                                                                             'value' => 'Not reviewed',
                                                                                                             'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11349'
                                                                                                           }
                                                                                                         ],
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                     },
                                                              'attachment' => {
                                                                                'operations' => [
                                                                                                  'set',
                                                                                                  'copy'
                                                                                                ],
                                                                                'schema' => {
                                                                                              'system' => 'attachment',
                                                                                              'type' => 'array',
                                                                                              'items' => 'attachment'
                                                                                            },
                                                                                'key' => 'attachment',
                                                                                'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'name' => 'Attachment',
                                                                                'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                              },
                                                              'description' => {
                                                                                 'operations' => [
                                                                                                   'set'
                                                                                                 ],
                                                                                 'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'name' => 'Description',
                                                                                 'schema' => {
                                                                                               'type' => 'string',
                                                                                               'system' => 'description'
                                                                                             },
                                                                                 'key' => 'description'
                                                                               },
                                                              'components' => {
                                                                                'allowedValues' => [],
                                                                                'operations' => [
                                                                                                  'add',
                                                                                                  'set',
                                                                                                  'remove'
                                                                                                ],
                                                                                'key' => 'components',
                                                                                'schema' => {
                                                                                              'system' => 'components',
                                                                                              'items' => 'component',
                                                                                              'type' => 'array'
                                                                                            },
                                                                                'name' => 'Components',
                                                                                'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                              },
                                                              'versions' => {
                                                                              'allowedValues' => [
                                                                                                   {
                                                                                                     'id' => '13669',
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13669',
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'projectId' => 10565,
                                                                                                     'name' => '0.8'
                                                                                                   },
                                                                                                   {
                                                                                                     'projectId' => 10565,
                                                                                                     'name' => '0.7',
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13696',
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'id' => '13696'
                                                                                                   },
                                                                                                   {
                                                                                                     'name' => '0.9',
                                                                                                     'projectId' => 10565,
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13697',
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'id' => '13697'
                                                                                                   },
                                                                                                   {
                                                                                                     'id' => '13698',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13698',
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'projectId' => 10565,
                                                                                                     'name' => '6.6'
                                                                                                   }
                                                                                                 ],
                                                                              'operations' => [
                                                                                                'set',
                                                                                                'add',
                                                                                                'remove'
                                                                                              ],
                                                                              'key' => 'versions',
                                                                              'schema' => {
                                                                                            'system' => 'versions',
                                                                                            'items' => 'version',
                                                                                            'type' => 'array'
                                                                                          },
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'name' => 'Affects versions',
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                            },
                                                              'project' => {
                                                                             'allowedValues' => [
                                                                                                  {
                                                                                                    'name' => 'ZTNA - Test 27',
                                                                                                    'self' => 'https://appgateinc.atlassian.net/rest/api/2/project/10565',
                                                                                                    'simplified' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                    'avatarUrls' => {
                                                                                                                      '48x48' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402',
                                                                                                                      '16x16' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=xsmall',
                                                                                                                      '32x32' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=medium',
                                                                                                                      '24x24' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=small'
                                                                                                                    },
                                                                                                    'projectCategory' => {
                                                                                                                           'self' => 'https://appgateinc.atlassian.net/rest/api/2/projectCategory/10013',
                                                                                                                           'description' => 'ZTNA Projects',
                                                                                                                           'id' => '10013',
                                                                                                                           'name' => 'ZTNA'
                                                                                                                         },
                                                                                                    'projectTypeKey' => 'software',
                                                                                                    'key' => 'ZT27',
                                                                                                    'id' => '10565'
                                                                                                  }
                                                                                                ],
                                                                             'operations' => [
                                                                                               'set'
                                                                                             ],
                                                                             'key' => 'project',
                                                                             'schema' => {
                                                                                           'type' => 'project',
                                                                                           'system' => 'project'
                                                                                         },
                                                                             'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                             'name' => 'Project',
                                                                             'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                           },
                                                              'customfield_10028' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Story Points',
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'key' => 'customfield_10028',
                                                                                       'schema' => {
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:float',
                                                                                                     'customId' => 10028,
                                                                                                     'type' => 'number'
                                                                                                   }
                                                                                     },
                                                              'customfield_11016' => {
                                                                                       'schema' => {
                                                                                                     'customId' => 11016,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:textarea',
                                                                                                     'type' => 'string'
                                                                                                   },
                                                                                       'key' => 'customfield_11016',
                                                                                       'name' => 'Release note',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'assignee' => {
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'name' => 'Assignee',
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'schema' => {
                                                                                            'type' => 'user',
                                                                                            'system' => 'assignee'
                                                                                          },
                                                                              'key' => 'assignee',
                                                                              'autoCompleteUrl' => 'https://appgateinc.atlassian.net/rest/api/2/user/assignable/search?project=ZT27&query=',
                                                                              'operations' => [
                                                                                                'set'
                                                                                              ]
                                                                            },
                                                              'parent' => {
                                                                            'operations' => [
                                                                                              'set'
                                                                                            ],
                                                                            'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'name' => 'Parent',
                                                                            'schema' => {
                                                                                          'system' => 'parent',
                                                                                          'type' => 'issuelink'
                                                                                        },
                                                                            'key' => 'parent'
                                                                          },
                                                              'duedate' => {
                                                                             'schema' => {
                                                                                           'system' => 'duedate',
                                                                                           'type' => 'date'
                                                                                         },
                                                                             'key' => 'duedate',
                                                                             'name' => 'Due date',
                                                                             'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'operations' => [
                                                                                               'set'
                                                                                             ]
                                                                           }
                                                            },
                                                'description' => '',
                                                'subtask' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                'id' => '10953'
                                              },
                                              {
                                                'expand' => 'fields',
                                                'fields' => {
                                                              'issuetype' => {
                                                                               'operations' => [],
                                                                               'allowedValues' => [
                                                                                                    {
                                                                                                      'subtask' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                      'id' => '10984',
                                                                                                      'description' => '',
                                                                                                      'hierarchyLevel' => 0,
                                                                                                      'self' => 'https://appgateinc.atlassian.net/rest/api/2/issuetype/10984',
                                                                                                      'avatarId' => 10300,
                                                                                                      'name' => 'Sanitation',
                                                                                                      'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/issuetype/avatar/10300?size=medium'
                                                                                                    }
                                                                                                  ],
                                                                               'key' => 'issuetype',
                                                                               'schema' => {
                                                                                             'type' => 'issuetype',
                                                                                             'system' => 'issuetype'
                                                                                           },
                                                                               'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                               'name' => 'Issue Type',
                                                                               'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'}
                                                                             },
                                                              'customfield_10851' => {
                                                                                       'allowedValues' => [
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11351',
                                                                                                              'id' => '11351',
                                                                                                              'value' => 'Advisor'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11352',
                                                                                                              'id' => '11352',
                                                                                                              'value' => 'Aitorbot'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11353',
                                                                                                              'id' => '11353',
                                                                                                              'value' => 'Appliance'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11354',
                                                                                                              'value' => 'Arc (Container)',
                                                                                                              'id' => '11354'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11355',
                                                                                                              'value' => 'CI/CD',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11355'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11356',
                                                                                                              'id' => '11356',
                                                                                                              'value' => 'Clean Pipe'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Client',
                                                                                                              'id' => '11357',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11357'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11478',
                                                                                                              'value' => 'Controller',
                                                                                                              'id' => '11478'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11358',
                                                                                                              'value' => 'Connector',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11358'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'DevOps',
                                                                                                              'id' => '11359',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11359'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11360',
                                                                                                              'id' => '11360',
                                                                                                              'value' => 'Envy'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Frontend',
                                                                                                              'id' => '11361',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11361'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11362',
                                                                                                              'id' => '11362',
                                                                                                              'value' => 'Gateway'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11363',
                                                                                                              'value' => 'Helvetest',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11363'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11364',
                                                                                                              'value' => 'Injector',
                                                                                                              'id' => '11364'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'LogServer & Forwarder',
                                                                                                              'id' => '11365',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11365'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Manual ',
                                                                                                              'id' => '11366',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11366'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11367',
                                                                                                              'value' => 'Metrics',
                                                                                                              'id' => '11367'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11368',
                                                                                                              'id' => '11368',
                                                                                                              'value' => 'Operator'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Portal',
                                                                                                              'id' => '11369',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11369'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11350',
                                                                                                              'value' => 'Other',
                                                                                                              'id' => '11350'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11370',
                                                                                                              'value' => 'SDK',
                                                                                                              'id' => '11370'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11371',
                                                                                                              'value' => 'SDPCTL',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11371'
                                                                                                            },
                                                                                                            {
                                                                                                              'value' => 'Terraform Provider',
                                                                                                              'id' => '11372',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11372'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11477',
                                                                                                              'value' => 'Test',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11477'
                                                                                                            }
                                                                                                          ],
                                                                                       'name' => 'ZTNA Subsystem',
                                                                                       'schema' => {
                                                                                                     'type' => 'option',
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:select',
                                                                                                     'customId' => 10851
                                                                                                   },
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'defaultValue' => {
                                                                                                           'id' => '11350',
                                                                                                           'value' => 'Other',
                                                                                                           'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11350'
                                                                                                         },
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'key' => 'customfield_10851'
                                                                                     },
                                                              'labels' => {
                                                                            'key' => 'labels',
                                                                            'schema' => {
                                                                                          'items' => 'string',
                                                                                          'type' => 'array',
                                                                                          'system' => 'labels'
                                                                                        },
                                                                            'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'name' => 'Labels',
                                                                            'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'operations' => [
                                                                                              'add',
                                                                                              'set',
                                                                                              'remove'
                                                                                            ],
                                                                            'autoCompleteUrl' => 'https://appgateinc.atlassian.net/rest/api/1.0/labels/suggest?query='
                                                                          },
                                                              'customfield_10818' => {
                                                                                       'allowedValues' => [
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11345',
                                                                                                              'id' => '11345',
                                                                                                              'value' => 'No Impact'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11346',
                                                                                                              'value' => 'Docs Needs Update',
                                                                                                              'id' => '11346'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11347',
                                                                                                              'value' => 'Release Notes Needs Update',
                                                                                                              'id' => '11347'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11348',
                                                                                                              'value' => 'VPAT Needs Update',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11348'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11349',
                                                                                                              'value' => 'Not reviewed',
                                                                                                              'id' => '11349'
                                                                                                            }
                                                                                                          ],
                                                                                       'name' => 'ZTNA Impact',
                                                                                       'schema' => {
                                                                                                     'items' => 'option',
                                                                                                     'type' => 'array',
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:multiselect',
                                                                                                     'customId' => 10818
                                                                                                   },
                                                                                       'operations' => [
                                                                                                         'add',
                                                                                                         'set',
                                                                                                         'remove'
                                                                                                       ],
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'defaultValue' => [
                                                                                                           {
                                                                                                             'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11349',
                                                                                                             'id' => '11349',
                                                                                                             'value' => 'Not reviewed'
                                                                                                           }
                                                                                                         ],
                                                                                       'key' => 'customfield_10818'
                                                                                     },
                                                              'description' => {
                                                                                 'key' => 'description',
                                                                                 'schema' => {
                                                                                               'type' => 'string',
                                                                                               'system' => 'description'
                                                                                             },
                                                                                 'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'name' => 'Description',
                                                                                 'operations' => [
                                                                                                   'set'
                                                                                                 ]
                                                                               },
                                                              'attachment' => {
                                                                                'operations' => [
                                                                                                  'set',
                                                                                                  'copy'
                                                                                                ],
                                                                                'name' => 'Attachment',
                                                                                'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'key' => 'attachment',
                                                                                'schema' => {
                                                                                              'type' => 'array',
                                                                                              'items' => 'attachment',
                                                                                              'system' => 'attachment'
                                                                                            }
                                                                              },
                                                              'components' => {
                                                                                'schema' => {
                                                                                              'items' => 'component',
                                                                                              'type' => 'array',
                                                                                              'system' => 'components'
                                                                                            },
                                                                                'key' => 'components',
                                                                                'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                'name' => 'Components',
                                                                                'operations' => [
                                                                                                  'add',
                                                                                                  'set',
                                                                                                  'remove'
                                                                                                ],
                                                                                'allowedValues' => []
                                                                              },
                                                              'versions' => {
                                                                              'allowedValues' => [
                                                                                                   {
                                                                                                     'id' => '13669',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13669',
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'projectId' => 10565,
                                                                                                     'name' => '0.8'
                                                                                                   },
                                                                                                   {
                                                                                                     'name' => '0.7',
                                                                                                     'projectId' => 10565,
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13696',
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'id' => '13696'
                                                                                                   },
                                                                                                   {
                                                                                                     'projectId' => 10565,
                                                                                                     'name' => '0.9',
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13697',
                                                                                                     'id' => '13697'
                                                                                                   },
                                                                                                   {
                                                                                                     'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13698',
                                                                                                     'id' => '13698',
                                                                                                     'projectId' => 10565,
                                                                                                     'name' => '6.6',
                                                                                                     'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                                   }
                                                                                                 ],
                                                                              'operations' => [
                                                                                                'set',
                                                                                                'add',
                                                                                                'remove'
                                                                                              ],
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'name' => 'Affects versions',
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'key' => 'versions',
                                                                              'schema' => {
                                                                                            'system' => 'versions',
                                                                                            'type' => 'array',
                                                                                            'items' => 'version'
                                                                                          }
                                                                            },
                                                              'project' => {
                                                                             'operations' => [
                                                                                               'set'
                                                                                             ],
                                                                             'allowedValues' => [
                                                                                                  {
                                                                                                    'id' => '10565',
                                                                                                    'projectTypeKey' => 'software',
                                                                                                    'projectCategory' => {
                                                                                                                           'self' => 'https://appgateinc.atlassian.net/rest/api/2/projectCategory/10013',
                                                                                                                           'description' => 'ZTNA Projects',
                                                                                                                           'id' => '10013',
                                                                                                                           'name' => 'ZTNA'
                                                                                                                         },
                                                                                                    'key' => 'ZT27',
                                                                                                    'self' => 'https://appgateinc.atlassian.net/rest/api/2/project/10565',
                                                                                                    'avatarUrls' => {
                                                                                                                      '24x24' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=small',
                                                                                                                      '32x32' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=medium',
                                                                                                                      '48x48' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402',
                                                                                                                      '16x16' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=xsmall'
                                                                                                                    },
                                                                                                    'simplified' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                    'name' => 'ZTNA - Test 27'
                                                                                                  }
                                                                                                ],
                                                                             'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                             'name' => 'Project',
                                                                             'schema' => {
                                                                                           'type' => 'project',
                                                                                           'system' => 'project'
                                                                                         },
                                                                             'key' => 'project'
                                                                           },
                                                              'customfield_10028' => {
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Story Points',
                                                                                       'schema' => {
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:float',
                                                                                                     'customId' => 10028,
                                                                                                     'type' => 'number'
                                                                                                   },
                                                                                       'key' => 'customfield_10028',
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ]
                                                                                     },
                                                              'customfield_11016' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Release note',
                                                                                       'schema' => {
                                                                                                     'customId' => 11016,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:textarea',
                                                                                                     'type' => 'string'
                                                                                                   },
                                                                                       'key' => 'customfield_11016'
                                                                                     },
                                                              'assignee' => {
                                                                              'schema' => {
                                                                                            'system' => 'assignee',
                                                                                            'type' => 'user'
                                                                                          },
                                                                              'key' => 'assignee',
                                                                              'name' => 'Assignee',
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'operations' => [
                                                                                                'set'
                                                                                              ],
                                                                              'autoCompleteUrl' => 'https://appgateinc.atlassian.net/rest/api/2/user/assignable/search?project=ZT27&query='
                                                                            },
                                                              'parent' => {
                                                                            'operations' => [
                                                                                              'set'
                                                                                            ],
                                                                            'key' => 'parent',
                                                                            'schema' => {
                                                                                          'type' => 'issuelink',
                                                                                          'system' => 'parent'
                                                                                        },
                                                                            'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                            'name' => 'Parent'
                                                                          },
                                                              'duedate' => {
                                                                             'schema' => {
                                                                                           'system' => 'duedate',
                                                                                           'type' => 'date'
                                                                                         },
                                                                             'key' => 'duedate',
                                                                             'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'name' => 'Due date',
                                                                             'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'operations' => [
                                                                                               'set'
                                                                                             ]
                                                                           },
                                                              'priority' => {
                                                                              'operations' => [
                                                                                                'set'
                                                                                              ],
                                                                              'key' => 'priority',
                                                                              'defaultValue' => {
                                                                                                  'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10013',
                                                                                                  'id' => '10013',
                                                                                                  'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10679?size=medium',
                                                                                                  'name' => '200',
                                                                                                  'avatarId' => 10679
                                                                                                },
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                              'allowedValues' => [
                                                                                                   {
                                                                                                     'avatarId' => 10674,
                                                                                                     'name' => '500',
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10674?size=medium',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10010',
                                                                                                     'id' => '10010'
                                                                                                   },
                                                                                                   {
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10677?size=medium',
                                                                                                     'avatarId' => 10677,
                                                                                                     'name' => '400',
                                                                                                     'id' => '10011',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10011'
                                                                                                   },
                                                                                                   {
                                                                                                     'id' => '10012',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10012',
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10672?size=medium',
                                                                                                     'avatarId' => 10672,
                                                                                                     'name' => '300'
                                                                                                   },
                                                                                                   {
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10013',
                                                                                                     'id' => '10013',
                                                                                                     'avatarId' => 10679,
                                                                                                     'name' => '200',
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10679?size=medium'
                                                                                                   },
                                                                                                   {
                                                                                                     'avatarId' => 10673,
                                                                                                     'name' => '100',
                                                                                                     'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/priority/avatar/10673?size=medium',
                                                                                                     'id' => '10014',
                                                                                                     'self' => 'https://appgateinc.atlassian.net/rest/api/2/priority/10014'
                                                                                                   }
                                                                                                 ],
                                                                              'schema' => {
                                                                                            'type' => 'priority',
                                                                                            'system' => 'priority'
                                                                                          },
                                                                              'name' => 'Priority'
                                                                            },
                                                              'customfield_10983' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Original estimate',
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'key' => 'customfield_10983',
                                                                                       'schema' => {
                                                                                                     'customId' => 10983,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:float',
                                                                                                     'type' => 'number'
                                                                                                   }
                                                                                     },
                                                              'fixVersions' => {
                                                                                 'allowedValues' => [
                                                                                                      {
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13669',
                                                                                                        'id' => '13669',
                                                                                                        'name' => '0.8',
                                                                                                        'projectId' => 10565,
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                                      },
                                                                                                      {
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'name' => '0.7',
                                                                                                        'projectId' => 10565,
                                                                                                        'id' => '13696',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13696'
                                                                                                      },
                                                                                                      {
                                                                                                        'name' => '0.9',
                                                                                                        'projectId' => 10565,
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13697',
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'id' => '13697'
                                                                                                      },
                                                                                                      {
                                                                                                        'projectId' => 10565,
                                                                                                        'name' => '6.6',
                                                                                                        'archived' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'released' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                                        'self' => 'https://appgateinc.atlassian.net/rest/api/2/version/13698',
                                                                                                        'id' => '13698'
                                                                                                      }
                                                                                                    ],
                                                                                 'operations' => [
                                                                                                   'set',
                                                                                                   'add',
                                                                                                   'remove'
                                                                                                 ],
                                                                                 'key' => 'fixVersions',
                                                                                 'schema' => {
                                                                                               'items' => 'version',
                                                                                               'type' => 'array',
                                                                                               'system' => 'fixVersions'
                                                                                             },
                                                                                 'name' => 'Fix versions',
                                                                                 'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                 'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                               },
                                                              'customfield_10720' => {
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'defaultValue' => {
                                                                                                           'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11253',
                                                                                                           'id' => '11253',
                                                                                                           'value' => 'No Team'
                                                                                                         },
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                                       'key' => 'customfield_10720',
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'name' => 'ZTNA Team',
                                                                                       'schema' => {
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:select',
                                                                                                     'customId' => 10720,
                                                                                                     'type' => 'option'
                                                                                                   },
                                                                                       'allowedValues' => [
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11253',
                                                                                                              'value' => 'No Team',
                                                                                                              'id' => '11253'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11254',
                                                                                                              'value' => 'Core',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11254'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11255',
                                                                                                              'value' => 'Data Plane',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11255'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11256',
                                                                                                              'value' => 'Integrations',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11256'
                                                                                                            },
                                                                                                            {
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11257',
                                                                                                              'id' => '11257',
                                                                                                              'value' => 'Platform'
                                                                                                            },
                                                                                                            {
                                                                                                              'id' => '11258',
                                                                                                              'value' => 'UI',
                                                                                                              'self' => 'https://appgateinc.atlassian.net/rest/api/2/customFieldOption/11258'
                                                                                                            }
                                                                                                          ]
                                                                                     },
                                                              'summary' => {
                                                                             'operations' => [
                                                                                               'set'
                                                                                             ],
                                                                             'key' => 'summary',
                                                                             'schema' => {
                                                                                           'type' => 'string',
                                                                                           'system' => 'summary'
                                                                                         },
                                                                             'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                             'name' => 'Summary',
                                                                             'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'}
                                                                           },
                                                              'timetracking' => {
                                                                                  'schema' => {
                                                                                                'type' => 'timetracking',
                                                                                                'system' => 'timetracking'
                                                                                              },
                                                                                  'key' => 'timetracking',
                                                                                  'name' => 'Time tracking',
                                                                                  'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                  'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                  'operations' => [
                                                                                                    'set',
                                                                                                    'edit'
                                                                                                  ]
                                                                                },
                                                              'customfield_10020' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'key' => 'customfield_10020',
                                                                                       'schema' => {
                                                                                                     'type' => 'array',
                                                                                                     'items' => 'json',
                                                                                                     'customId' => 10020,
                                                                                                     'custom' => 'com.pyxis.greenhopper.jira:gh-sprint'
                                                                                                   },
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Sprint',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                     },
                                                              'customfield_10950' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Craft link',
                                                                                       'key' => 'customfield_10950',
                                                                                       'schema' => {
                                                                                                     'customId' => 10950,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:url',
                                                                                                     'type' => 'string'
                                                                                                   }
                                                                                     },
                                                              'customfield_10014' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'schema' => {
                                                                                                     'customId' => 10014,
                                                                                                     'custom' => 'com.pyxis.greenhopper.jira:gh-epic-link',
                                                                                                     'type' => 'any'
                                                                                                   },
                                                                                       'key' => 'customfield_10014',
                                                                                       'name' => 'Epic Link',
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'}
                                                                                     },
                                                              'reporter' => {
                                                                              'autoCompleteUrl' => 'https://appgateinc.atlassian.net/rest/api/2/user/recommend?context=Reporter&issueKey=',
                                                                              'operations' => [
                                                                                                'set'
                                                                                              ],
                                                                              'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                              'name' => 'Reporter',
                                                                              'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'reporter'}{'required'},
                                                                              'schema' => {
                                                                                            'system' => 'reporter',
                                                                                            'type' => 'user'
                                                                                          },
                                                                              'key' => 'reporter'
                                                                            },
                                                              'customfield_10752' => {
                                                                                       'operations' => [
                                                                                                         'set'
                                                                                                       ],
                                                                                       'required' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'name' => 'Original Creation Date',
                                                                                       'hasDefaultValue' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                                                       'key' => 'customfield_10752',
                                                                                       'schema' => {
                                                                                                     'type' => 'date',
                                                                                                     'customId' => 10752,
                                                                                                     'custom' => 'com.atlassian.jira.plugin.system.customfieldtypes:datepicker'
                                                                                                   }
                                                                                     }
                                                            },
                                                'id' => '10984',
                                                'subtask' => $VAR1->{'projects'}[0]{'issuetypes'}[0]{'fields'}{'customfield_10014'}{'hasDefaultValue'},
                                                'description' => '',
                                                'iconUrl' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/issuetype/avatar/10300?size=medium',
                                                'name' => 'Sanitation',
                                                'hierarchyLevel' => 0,
                                                'untranslatedName' => 'Sanitation',
                                                'self' => 'https://appgateinc.atlassian.net/rest/api/2/issuetype/10984'
                                              }
                                            ],
                            'name' => 'ZTNA - Test 27',
                            'avatarUrls' => {
                                              '32x32' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=medium',
                                              '24x24' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=small',
                                              '48x48' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402',
                                              '16x16' => 'https://appgateinc.atlassian.net/rest/api/2/universal_avatar/view/type/project/avatar/10402?size=xsmall'
                                            },
                            'self' => 'https://appgateinc.atlassian.net/rest/api/2/project/10565',
                            'key' => 'ZT27',
                            'expand' => 'issuetypes',
                            'id' => '10565'
                          }
                        ]
        };