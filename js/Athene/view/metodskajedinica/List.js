Ext.define('Athene.view.metodskajedinica.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.metodskajedinicalist',
    id: 'metodskajedinicalist',
    
    title: 'Popis Metodskih jedinica',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'metodskajedinicagrid',
                store: 'MetodskaJedinica',
                forceFit: true,
                columns: [
                    {
                        text: 'Opis',
                        dataIndex: 'opis'
                    },
                    {
                        text: 'Nastavna jedinica',
                        dataIndex: 'nastavna_jedinica_id'
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
                                    var view = Ext.widget('metodskajedinicaform');
                                    view.down('form').loadRecord(Ext.getStore('MetodskaJedinica').getAt(rowIndex));
                                    view.down('#formMetodskaJedinicaSubmit').text = 'Spremi';
                                    view.title = 'Izmijeni: ' + Ext.getStore('MetodskaJedinica').getAt(rowIndex).data.opis;
                                    view.renderTo = '#metodskajedinicalist';
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
                        text: 'Dodaj metodsku jedinicu', 
                        id: 'openMetodskaJedinicaForm'
                    }
                ]
            },
            {
                xtype: 'pagingtoolbar',
                store: 'MetodskaJedinica',
                dock: 'bottom',
                displayInfo: true
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('metodskajedinicalist', Athene.view.metodskajedinica.List);