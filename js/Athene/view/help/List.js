Ext.define('Athene.view.help.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.helplist',
    id: 'helplist',
    
    title: 'Sustav za pomoć',
    layout: 'fit',
    width: 600,
    minWidth: 600,
    height: 300,
    minHeight: 300,
    maximizable: true,
    constrain: true,
    
    tools: [
        {
            type: 'help',
            id: 'helpHelpList',
            qtip: 'Pomoć'
        }
    ],
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'helpgrid',
                store: 'Help',
                forceFit: true,
                columns: [
                    {
                        text: 'Naslov',
                        dataIndex: 'title'
                    },
                    {
                        text: 'Tag',
                        dataIndex: 'tag'
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
                                    var view = Ext.widget('helpform');
                                    view.down('form').loadRecord(Ext.getStore('Help').getAt(rowIndex));
                                    view.down('#formHelpSubmit').text = 'Spremi';
                                    view.title = 'Izmijeni: ' + Ext.getStore('Help').getAt(rowIndex).data.tag;
                                    view.renderTo = '#helplist';
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
                                    var helpId = Ext.getStore('Help').getAt(rowIndex).data.id;
                                    Help.delete(helpId, function(provider, response) {
                                        console.log(provider, response);
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
                        text: 'Dodaj help', 
                        id: 'openHelpForm'
                    },
                    /*'->',
                    {
                        xtype: 'textfield',
                        id: 'listMjestoSearch',
                        fieldLabel: false,
                        emptyText: 'traži...',
                        labelAlign: 'right'
                    },
                    {
                        xtype: 'button',
                        icon: 'img/icons/cancel.png',
                        id: 'listMjestoClearFilter'
                    }*/
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});

Ext.ComponentManager.registerType('helplist', Athene.view.help.List);