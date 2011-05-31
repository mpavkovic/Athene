Ext.define('Athene.view.dogadjaj.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.dogadjajlist',
    id: 'dogadjajlist',
    
    title: 'Popis događaja',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
	
	tools: [
        {
            type: 'help',
            id: 'helpDogadjaji',
            qtip: 'Pomoć'
        }
    ],
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'dogadjajgrid',
                store: 'Dogadjaj',
                forceFit: true,
                columns: [
                    {
                        text: 'Naziv',
                        dataIndex: 'naziv',
						maxLength: 200
                    },
                    {
                        text: 'Opis',
                        dataIndex: 'opis'
                    },
					{
						text: 'Datum',
						dataIndex: 'datum'
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
                                    var view = Ext.widget('dogadjajform');
                                    view.down('form').loadRecord(Ext.getStore('Dogadjaj').getAt(rowIndex));
                                    view.down('#formDogadjajSubmit').text = 'Spremi';
                                    view.title = 'Izmijeni: ' + Ext.getStore('Dogadjaj').getAt(rowIndex).data.naziv;
                                    view.renderTo = '#dogadjajlist';
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
                        text: 'Dodaj događaj', 
                        id: 'openDogadjajForm'
                    }
                ]
            },
            {
                xtype: 'pagingtoolbar',
                store: 'Dogadjaj',
                dock: 'bottom',
                displayInfo: true
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('dogadjajlist', Athene.view.dogadjaj.List);