Ext.define('Athene.view.user.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.userlist',
    id: 'userlist',
    
    title: 'Popis korisnika',
    layout: 'fit',
    width: 600,
    minWidth: 600,
    height: 300,
    minHeight: 300,
    maximizable: true,
    constrain: true,
    closeAction: 'hide',
    
    tools: [
        {
            type: 'help',
            id: 'helpUserList',
            qtip: 'Pomoć'
        }
    ],
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'usergrid',
                store: 'User',
                forceFit: true,
                columns: [
                    {
                        text: 'Korisničko ime',
                        dataIndex: 'username'
                    },
                    {
                        xtype: 'templatecolumn',
                        text: 'Puno ime',
                        dataIndex: 'last_name',
                        tpl: '{last_name} {first_name}'
                    },
                    {
                        text: 'E-mail',
                        dataIndex: 'email'
                    },
                    {
                        text: 'Grupa',
                        dataIndex: 'group_id'
                    },
                    {
                        xtype: 'actioncolumn',
                        width: 20,
                        items: [
                            {
                                icon: 'img/icons/application_form_edit.png',
                                tooltip: 'Izmijeni',
                                iconCls: 'editAction',
                                handler: function(grid, rowIndex, columnIndex) {
                                    var view = Ext.widget('userform');
                                    view.down('form').loadRecord(Ext.getStore('User').getAt(rowIndex));
                                    view.down('#formUserSubmit').text = 'Spremi';
                                    view.title = 'Izmijeni: ' + Ext.getStore('User').getAt(rowIndex).data.username;
                                    view.renderTo = '#userlist';
                                    view.modal = true; // Make window modal so the list is inacesible
                                    view.show();
                                }
                            },
                            '-',
                            {
                                icon: 'img/icons/delete.png',
                                tooltip: 'Izbriši',
                                iconCls: 'deleteAction',
                                handler: function(grid, rowIndex, columnIndex) {
                                    var userId = Ext.getStore('User').getAt(rowIndex).data.id;
                                    User.delete(userId, function(provider, response) {
                                        console.log(provider, response);
                                        if(provider.success == true) {
                                            var sm = grid.getSelectionModel();
                                            grid.store.removeAt(rowIndex);
                                        }
                                    })
                                }
                            }
                        ]
                    }
                ],
                viewConfig: {
                    stripeRows: true
                }
            }
        ];
        
        this.dockedItems = [
            {
                xtype: 'toolbar',
                dock: 'top',
                items: [
                    {
                        xtype: 'button',
                        icon: 'img/icons/add.png',
                        text: 'Dodaj korisnika', 
                        id: 'openUserForm'
                    },
                    '->',
                    {
                        xtype: 'textfield',
                        id: 'listUserSearch',
                        fieldLabel: false,
                        emptyText: 'traži...',
                        labelAlign: 'right'
                    },
                    {
                        xtype: 'button',
                        icon: 'img/icons/cancel.png',
                        id: 'listUserClearFilter'
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});

Ext.ComponentManager.registerType('userlist', Athene.view.user.List);

