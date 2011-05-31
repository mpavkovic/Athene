Ext.define('Athene.view.mjesto.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.mjestolist',
    id: 'mjestolist',
    
    title: 'Popis mjesta',
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
            id: 'helpMjestoList',
            qtip: 'Pomoć'
        }
    ],
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'mjestogrid',
                store: 'Mjesto',
                forceFit: true,
                columns: [
                    {
                        text: 'Poštanski broj',
                        dataIndex: 'post_br',
                        width: 40
                    },
                    {
                        text: 'Naziv',
                        dataIndex: 'naziv'
                    },
                    {
                        text: 'Država',
                        dataIndex: 'drzava_id',
                        /*renderer: function(value) {
                            return Ext.getStore('Drzava').getById(value).data.naziv;
                        }*/
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
                                    var view = Ext.widget('mjestoform');
                                    view.down('form').loadRecord(Ext.getStore('Mjesto').getAt(rowIndex));
                                    view.down('#formMjestoSubmit').text = 'Spremi';
                                    view.title = 'Izmijeni: ' + Ext.getStore('Mjesto').getAt(rowIndex).data.naziv;
                                    view.renderTo = '#mjestolist';
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
                                    var mjestoId = Ext.getStore('Mjesto').getAt(rowIndex).data.id;
                                    Mjesto.delete(mjestoId, function(provider, response) {
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
                        text: 'Dodaj mjesto', 
                        id: 'openMjestoForm'
                    },
                    '->',
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
                    }
                ]
            },
            {
                xtype: 'pagingtoolbar',
                store: 'Mjesto',
                dock: 'bottom',
                displayInfo: true
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('mjestolist', Athene.view.mjesto.List);