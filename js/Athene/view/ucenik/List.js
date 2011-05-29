Ext.define('Athene.view.ucenik.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.uceniklist',
    id: 'uceniklist',
    title: 'Popis Učenika',
    title: 'Popis učenika',
    layout: 'fit',
    width: 950,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'ucenikgrid',
                store: 'Ucenik',
                forceFit: true,
                columns: [
                    {
                        text: 'OIB',
                        dataIndex: 'oib'
                    },
                    {
                        text: 'JMBG',
                        dataIndex: 'jmbg'
                    },
                    {
                        text: 'Ime',
                        dataIndex: 'ime'
                    },
                    {
                        text: 'Prezime',
                        dataIndex: 'prezime'
                    },
                    {
                        text: 'Datum rođenja',
                        dataIndex: 'datum_rodjenja',
                        renderer: function(value) {
                            try {
                                return Ext.Date.format(Ext.Date.parse(value, 'Y-m-d'), 'd.m.Y.');
                            } catch (e) {
                                Ext.Msg.alert("Error", "Error during date conversion: " + e);
                            }
                            return '#error';
                        }
                    },
                    {
                        text: 'Mjesto rođenja',
                        dataIndex: 'mjesto_rodjenja'
                    },
                    {
                        text: 'Spol',
                        dataIndex: 'spol'
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
                                    console.log(Ext.getStore('Ucenik').getAt(rowIndex));
                                    var view = Ext.widget('ucenikform');
                                    view.down('form').loadRecord(Ext.getStore('Ucenik').getAt(rowIndex));
                                    view.down('#formUcenikSubmit').text = 'Spremi';
                                    view.title = 'Izmijeni: ' + Ext.getStore('Ucenik').getAt(rowIndex).data.oib;
                                    view.renderTo = '#uceniklist';
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
                                        console.log(provider, response);
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
                        text: 'Dodaj učenika', 
                        id: 'openUcenikForm'
                    },
                    {
                        xtype: 'button',
                        icon: 'img/icons/refresh.png',
                        text: 'Osvježi',
                        id: 'refreshUcenikList'
                    },
                    '->',
                    {
                        xtype: 'textfield',
                        emptyText: 'traži...',
                        id: 'listUcenikSearch',
                        fieldLabel: false
                    }
                ]
            },
            {
                xtype: 'pagingtoolbar',
                store: 'Ucenik',
                dock: 'bottom',
                displayInfo: true
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('uceniklist', Athene.view.ucenik.List);