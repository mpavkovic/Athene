Ext.define('Athene.view.nastavnisat.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.nastavnisatlist',
    id: 'nastavnisatlist',
    
    title: 'Popis Nastavnih Satova',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'nastavnisatgrid',
                store: 'NastavniSat',
                forceFit: true,
                columns: [
                    {
                        text: 'Ucitelj',
                        dataIndex: 'ucitelj_id'
                    },
                    {
                        text: 'Datum',
                        dataIndex: 'datum'
                    },
                    {
                        text: 'Opis',
                        dataIndex: 'opis'
                    },
                    {
                        text: 'Metodska jedinica',
                        dataIndex: 'metodska_jedinica_id'
                    },
                    {
                        text: 'Predmet razrednog odjeljenja',
                        dataIndex: 'predmet_razrednog_odjeljenja_id'
                    },
                    {
                        text: 'Napomena',
                        dataIndex: 'napomena'
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
                                    var view = Ext.widget('nastavnisatform');
                                    view.down('form').loadRecord(Ext.getStore('NastavniSat').getAt(rowIndex));
                                    view.down('#formNastavniSatSubmit').text = 'Spremi';
                                    view.title = 'Izmijeni: ' + Ext.getStore('NastavniSat').getAt(rowIndex).data.opis;
                                    view.renderTo = '#nastavnisatlist';
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
                        text: 'Dodaj nastavni sat', 
                        id: 'openNastavniSatForm'
                    }
                    
                ]
            },
            {
                        xtype: 'pagingtoolbar',
                        store: 'NastavniSat',
                        dock: 'bottom',
                        displayInfo: true
                    }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('nastavnisatlist', Athene.view.nastavnisat.List);