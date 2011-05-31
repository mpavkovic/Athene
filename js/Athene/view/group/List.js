Ext.define('Athene.view.group.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.grouplist',
    id: 'grouplist',
    title: 'Popis grupa',
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
            id: 'helpGroupList',
            qtip: 'Pomoć'
        }
    ],
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'groupgrid',
                store: 'User',
                forceFit: true,
                columns: [
                    {
                        text: 'Naziv',
                        dataIndex: 'name'
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
                                    var view = Ext.widget('groupform');
                                    view.down('form').loadRecord(Ext.getStore('Group').getAt(rowIndex));
                                    view.down('#formGroupSubmit').text = 'Spremi';
                                    view.title = 'Izmijeni: ' + Ext.getStore('Group').getAt(rowIndex).data.name;
                                    view.renderTo = '#grouplist';
                                    view.modal = true; // Make window modal so the list is inacesible
                                    view.show();
                                }
                            },
                            '-',
                            {
                                icon: 'img/icons/delete.png',
                                tooltip: 'Izbriši',
                                iconCls: 'deleteAction'
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
                        text: 'Dodaj grupu', 
                        id: 'openGroupForm'
                    }
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
        ];
        
        this.callParent(arguments);
    }
});

// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('grouplist', Athene.view.group.List);
