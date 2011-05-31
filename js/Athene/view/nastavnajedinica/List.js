Ext.define('Athene.view.nastavnajedinica.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.nastavnajedinicalist',
    id: 'nastavnajedinicalist',
    
    title: 'Popis Nastavnih jedinica',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'nastavnajedinicagrid',
                store: 'NastavnaJedinica',
                forceFit: true,
                columns: [
                    {
                        text: 'Opis',
                        dataIndex: 'opis'
                    },
                    {
                        text: 'Nastavni plan',
                        dataIndex: 'nastavni_plan_id',
                        renderer: function(value) {
                            return Ext.getStore('NastavniPlan').getById(value).data.opis;
                        }
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
                                    var view = Ext.widget('nastavnajedinicaform');
                                    view.down('form').loadRecord(Ext.getStore('NastavnaJedinica').getAt(rowIndex));
                                    view.down('#formNastavnaJedinicaSubmit').text = 'Spremi';
                                    view.title = 'Izmijeni: ' + Ext.getStore('NastavnaJedinica').getAt(rowIndex).data.opis;
                                    view.renderTo = '#nastavnajedinicalist';
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
                        text: 'Dodaj nastavnu jedinicu', 
                        id: 'openNastavnaJedinicaForm'
                    }
                ]
            },
            {
                xtype: 'pagingtoolbar',
                store: 'NastavnaJedinica',
                dock: 'bottom',
                displayInfo: true
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('nastavnajedinicalist', Athene.view.nastavnajedinica.List);