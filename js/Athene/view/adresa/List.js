Ext.define('Athene.view.adresa.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.adresalist',
    id: 'adresalist',
    
    title: 'Popis adresa (učenika)',
    layout: 'fit',
    width: 1000,
    height: 300,
    maximizable: true,
    constrain: true,
	
    tools: [
        {
            type: 'help',
            id: 'helpAdresaList',
            qtip: 'Pomoć'
        }
    ],
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'adresagrid',
                store: 'Adresa',
                forceFit: true,
                columns: [
                    {
                        text: 'Učenik',
                        dataIndex: 'ucenik_id'
                    },
                    {
                        text: 'Tip adrese',
                        dataIndex: 'tip_adrese'
                    },
                    {
                        text: 'Ulica',
                        dataIndex: 'ulica'
                    },
                    {
                        text: 'Broj',
                        dataIndex: 'broj'
                    },
                    {
                        text: 'Datum od',
                        dataIndex: 'datum_od'
                    },
                    {
                        text: 'Datum do',
                        dataIndex: 'datum_do'
                    },
                    {
                        text: 'Telefon',
                        dataIndex: 'telefon'
                    },
                    {
                        text: 'Mobitel',
                        dataIndex: 'mobitel'
                    },
                    {
                        text: 'Stanuje s',
                        dataIndex: 'stanuje_s'
                    },
                    {
                        text: 'Mjesto',
                        dataIndex: 'mjesto_id'
                    },
                    {
                        text: 'Razlog boravišta',
                        dataIndex: 'razlog_boravista_id'
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
                                    var view = Ext.widget('adresaform');
                                    view.down('form').loadRecord(Ext.getStore('Adresa').getAt(rowIndex));
                                    view.down('#formAdresaSubmit').text = 'Spremi';
                                    view.title = 'Izmijeni: ' + Ext.getStore('Adresa').getAt(rowIndex).data.ucenik_id;
                                    view.renderTo = '#adresalist';
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
                                    /*var userId = Ext.getStore('User').getAt(rowIndex).data.id;
                                    User.delete(userId, function(provider, response) {
                                        //console.log(provider, response);
                                        if(provider.success == true) {
                                            var sm = grid.getSelectionModel();
                                            grid.store.removeAt(rowIndex);
                                        }
                                    })*/
                                }
                            }
                        ]
                    }
                ]
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
                        text: 'Dodaj adresa', 
                        id: 'openAdresaForm'
                    }
                ]
            },
            {
                xtype: 'pagingtoolbar',
                store: 'Adresa',
                dock: 'bottom',
                displayInfo: true
            }
        ]
        
        this.callParent(arguments);
    }
});

Ext.ComponentManager.registerType('adresalist', Athene.view.adresa.List);