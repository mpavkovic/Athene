Ext.define('Athene.view.predmet.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.predmetlist',
    id: 'predmetlist',
    
    title: 'Popis Predmeta',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
		
    tools: [
        {
            type: 'help',
            id: 'helpPredmet',
            qtip: 'Pomoć'
        }
    ],
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'predmetgrid',
                store: 'Predmet',
                forceFit: true,
                columns: [
                    {
                        text: 'Naziv',
                        dataIndex: 'naziv'
                    },
                    {
                        text: 'Opis',
                        dataIndex: 'opis'
                    },
                    {
                        text: 'Razred',
                        dataIndex: 'razred'
                    },
                    {
                        text: 'Predviđen broj sati',
                        dataIndex: 'previdjen_broj_sati'
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
                                    var view = Ext.widget('predmetform');
                                    view.down('form').loadRecord(Ext.getStore('Predmet').getAt(rowIndex));
                                    view.down('#formPredmetSubmit').text = 'Spremi';
                                    view.title = 'Izmijeni: ' + Ext.getStore('Predmet').getAt(rowIndex).data.naziv;
                                    view.renderTo = '#predmetlist';
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
                        text: 'Dodaj predmet', 
                        id: 'openPredmetForm'
                    }
                ]
            },
	    {
                xtype: 'pagingtoolbar',
                store: 'Predmet',
                dock: 'bottom',
                displayInfo: true
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('predmetlist', Athene.view.predmet.List);