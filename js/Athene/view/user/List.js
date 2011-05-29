var rowEditing = Ext.create('Ext.grid.plugin.RowEditing', {
        clicksToMoveEditor: 1,
        autoCancel: false
    });
Ext.define('Athene.view.user.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.userlist',
    id: 'userlist',
    
    title: 'Popis korisnika',
    layout: 'fit',
    width: 600,
    minWidth: 600,
    height: 250,
    minHeight: 250,
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
					Ext.create('Ext.grid.RowNumberer'),
                    {
                        text: 'Korisničko ime',
                        dataIndex: 'username',
						editor: {
							// defaults to textfield if no xtype is supplied
							allowBlank: false
						}
                    },
                    {
                        xtype: 'templatecolumn',
                        text: 'Puno ime',
						flex: 1,
                        dataIndex: 'last_name',
                        tpl: '{last_name} {first_name}',
						editor: {
							// defaults to textfield if no xtype is supplied
							allowBlank: false
						}
                    },
                    {
                        text: 'E-mail',
                        dataIndex: 'email',
						editor: {
							allowBlank: false,
							vtype: 'email'
						}
                    },
                    {
                        text: 'Grupa',
                        dataIndex: 'group_id',
						editor: {
							// defaults to textfield if no xtype is supplied
							allowBlank: false
						}
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
				plugins: [rowEditing],
				columnLines: true,
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

