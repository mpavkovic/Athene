Ext.define('Athene.view.ocjena.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.ocjenalist',
    id: 'ocjenalist',
    
    title: 'Popis Ocjena',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,

	tools: [
        {
            type: 'help',
            id: 'helpOcjena',
            qtip: 'Pomoæ'
        }
    ],
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'ocjenagrid',
                store: 'Ocjena',
                forceFit: true,
                columns: [
                    {
                        text: 'Ocjena',
                        dataIndex: 'ocjena'
                    },
                    {
                        text: 'Ucenik',
                        dataIndex: 'ucenik_id'
                    },
                    {
                        text: 'Predmetna cjelina',
                        dataIndex: 'predmetna_cjelina_id'
                    },
                    {
                        text: 'Kategorija ocjena',
                        dataIndex: 'kategorija_ocjena_id'
                    },
                    {
                        text: 'Datum',
                        dataIndex: 'datum'
                    },
                    {
                        text: 'Opaska',
                        dataIndex: 'opaska'
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
                                    var view = Ext.widget('ocjenaform');
                                    view.down('form').loadRecord(Ext.getStore('Ocjena').getAt(rowIndex));
                                    view.down('#formOcjenaSubmit').text = 'Spremi';
                                    view.title = 'Izmijeni: ' + Ext.getStore('Ocjena').getAt(rowIndex).data.ocjena;
                                    view.renderTo = '#ocjenalist';
                                    view.modal = true; // Make window modal so the list is inacesible
                                    view.show();
                                }
                            },
                            '-',
                            {
                                icon: 'img/icons/delete.png',
                                tooltip: 'Izbrisi',
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
                        text: 'Dodaj ocjenu', 
                        id: 'openOcjenaForm'
                    }
                ]
            },
	    {
                xtype: 'pagingtoolbar',
                store: 'Ocjena',
                dock: 'bottom',
                displayInfo: true
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('ocjenalist', Athene.view.ocjena.List);