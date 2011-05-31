Ext.define('Athene.view.razlogboravista.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.razlogboravistalist',
    id: 'razlogboravistalist',
    
    title: 'Popis razloga boravišta',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'razlogboravistagrid',
                store: 'RazlogBoravista',
                forceFit: true,
                columns: [
                    {
                        text: 'Opis',
                        dataIndex: 'opis'
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
                                    var view = Ext.widget('razlogboravistaform');
                                    view.down('form').loadRecord(Ext.getStore('RazlogBoravista').getAt(rowIndex));
                                    view.down('#formRazlogBoravistaSubmit').text = 'Spremi';
                                    view.title = 'Izmijeni: ' + Ext.getStore('RazlogBoravista').getAt(rowIndex).data.opis;
                                    view.renderTo = '#razlogboravistalist';
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
                        text: 'Dodaj razlog boravišta', 
                        id: 'openRazlogBoravistaForm'
                    }
                ]
            },
            {
                xtype: 'pagingtoolbar',
                store: 'RazlogBoravista',
                dock: 'bottom',
                displayInfo: true
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('razlogboravistalist', Athene.view.razlogboravista.List);