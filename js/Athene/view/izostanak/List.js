Ext.define('Athene.view.izostanak.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.izostanaklist',
    id: 'izostanaklist',
    
    title: 'Popis izostanaka',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    closeAction: 'hide',
	
    tools: [
        {
            type: 'help',
            id: 'helpIzostanak',
            qtip: 'Pomoć'
        }
    ],
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'izostanakgrid',
                store: 'Izostanak',
                forceFit: true,
                columns: [
                    {
                        text: 'Učenik',
                        dataIndex: 'ucenik_id'
                    },
                    {
                        text: 'Predmet razrednog odjeljenja',
                        dataIndex: 'predmet_id'
                    },
                    {
                        text: 'Datum',
                        dataIndex: 'datum'
                    },
                    {
                        text: 'Opravdano',
                        dataIndex: 'opravdano'
                    },
                    {
                        text: 'Opravdanje',
                        dataIndex: 'opravdanje'
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
                                    var view = Ext.widget('izostanakform');
                                    view.down('form').loadRecord(Ext.getStore('Izostanak').getAt(rowIndex));
                                    view.down('#formIzostanakSubmit').text = 'Spremi';
                                    view.title = 'Izmijeni: ' + Ext.getStore('Izostanak').getAt(rowIndex).data.ucenik_id;
                                    view.renderTo = '#izostanaklist';
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
                        text: 'Dodaj izostanak', 
                        id: 'openIzostanakForm',
						tooltip: {text:'Ovo je neki opis nečega'}
                    },
                    {
                        xtype: 'splitbutton',
                        text: 'Predmet',
			tooltip: {text:'Izaberite nešto'},
			menu: {
			    items: [
				{
				    text: 'Dodaj predmet',
				    id: 'openIzostanakForm'
				},
				{
				    text: 'Popis predmeta'
				}
			    ]
			}
                    }
                ]
            },
            {
                xtype: 'pagingtoolbar',
                store: 'Izostanak',
                dock: 'bottom',
                displayInfo: true
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('izostanaklist', Athene.view.izostanak.List);