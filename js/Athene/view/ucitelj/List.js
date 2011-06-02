Ext.define('Athene.view.ucitelj.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.uciteljlist',
    id: 'uciteljlist',
    
    title: 'Popis učitelja',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
	
	tools: [
        {
            type: 'help',
            id: 'helpUcitelj',
            qtip: 'Pomoć'
        }
    ],
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'uciteljgrid',
                store: 'Ucitelj',
                forceFit: true,
                columns: [
                    {
                        text: 'ID',
                        dataIndex: 'id'
                    },
                    {
                        text: 'Prezime',
                        dataIndex: 'prezime'
                    },
		    {
                        text: 'Ime',
                        dataIndex: 'ime'
                    },
		    {
                        text: 'Titual (prefix)',
                        dataIndex: 'titula_prefix'
                    },
		    {
                        text: 'Titula (sufix)',
                        dataIndex: 'titula_sufix'
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
                                    var view = Ext.widget('uciteljform');
                                    view.down('form').loadRecord(Ext.getStore('Ucitelj').getAt(rowIndex));
                                    view.down('#formUciteljSubmit').text = 'Spremi';
                                    view.title = 'Izmijeni: ' + Ext.getStore('Ucitelj').getAt(rowIndex).data.id;
                                    view.renderTo = '#uciteljlist';
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
                        text: 'Dodaj učitelja', 
                        id: 'openUciteljForm'
                    }
                ]
            },
	    {
                xtype: 'pagingtoolbar',
                store: 'Ucitelj',
                dock: 'bottom',
                displayInfo: true
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('uciteljlist', Athene.view.ucitelj.List);