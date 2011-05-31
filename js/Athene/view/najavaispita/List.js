Ext.define('Athene.view.najavaispita.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.najavaispitalist',
    id: 'najavaispitalist',
    
    title: 'Popis najava ispita',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
	
	tools: [
        {
            type: 'help',
            id: 'helpNajavaIspita',
            qtip: 'Pomoæ'
        }
    ],
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'najavaispitagrid',
                store: 'NajavaIspita',
                forceFit: true,
                columns: [
                    {
                        text: 'Datum',
                        dataIndex: 'datum'
                    },
                    {
                        text: 'Predmet razrednog odjeljenja',
                        dataIndex: 'predmet_razrednog_odjeljenja_id'
                    },
                    {
                        text: 'Nastavni sat',
                        dataIndex: 'nastavni_sat_id'
                    },
                    {
                        text: 'Kategorija ocjena',
                        dataIndex: 'kategorija_ocjena_id'
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
                                    var view = Ext.widget('najavaispitaform');
                                    view.down('form').loadRecord(Ext.getStore('NajavaIspita').getAt(rowIndex));
                                    view.down('#formNajavaIspitaSubmit').text = 'Spremi';
                                    view.title = 'Izmijeni: ' + Ext.getStore('NajavaIspita').getAt(rowIndex).data.datum;
                                    view.renderTo = '#najavaispitalist';
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
                        text: 'Dodaj najavaispita', 
                        id: 'openNajavaIspitaForm'
                    }
                ]
            },
            {
                xtype: 'pagingtoolbar',
                store: 'NajavaIspita',
                dock: 'bottom',
                displayInfo: true
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('najavaispitalist', Athene.view.najavaispita.List);