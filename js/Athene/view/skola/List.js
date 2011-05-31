Ext.define('Athene.view.skola.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.skolalist',
    id: 'skolalist',
    
    title: 'Popis Škola',
    layout: 'fit',
    width: 800,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'skolagrid',
                store: 'Skola',
                forceFit: true,
                columns: [
                    {
                        text: 'Naziv',
                        dataIndex: 'naziv'
                    },
                    {
                        text: 'Ravnatelj',
                        dataIndex: 'ravnatelj'
                    },
                    {
                        text: 'Mjesto',
                        dataIndex: 'mjesto_id',
                        renderer: function(value) {
                            return Ext.getStore('Mjesto').getById(value).data.naziv;
                        }
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
                        text: 'Telefon',
                        dataIndex: 'telefon'
                    },
                    {
                        text: 'Email',
                        dataIndex: 'email'
                    },
                    {
                        text: 'Web sjedište',
                        dataIndex: 'web'
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
                                    var view = Ext.widget('skolaform');
                                    view.down('form').loadRecord(Ext.getStore('Skola').getAt(rowIndex));
                                    view.down('#formSkolaSubmit').text = 'Spremi';
                                    view.title = 'Izmijeni: ' + Ext.getStore('Skola').getAt(rowIndex).data.naziv;
                                    view.renderTo = '#skolalist';
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
                        text: 'Dodaj školu', 
                        id: 'openSkolaForm'
                    }
                ]
            },
            {
                xtype: 'pagingtoolbar',
                store: 'Skola',
                dock: 'bottom',
                displayInfo: true
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('skolalist', Athene.view.skola.List);