Ext.define('Athene.view.vrstaputnika.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.vrstaputnikalist',
    id: 'vrstaputnikalist',
    
    title: 'Popis vrsta putnika',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'vrstaputnikagrid',
                store: 'VrstaPutnika',
                forceFit: true,
                columns: [
                    {
                        text: 'Naziv',
                        dataIndex: 'naziv'
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
                                    var view = Ext.widget('vrstaputnikaform');
                                    view.down('form').loadRecord(Ext.getStore('VrstaPutnika').getAt(rowIndex));
                                    view.down('#formVrstaPutnikaSubmit').text = 'Spremi';
                                    view.title = 'Izmijeni: ' + Ext.getStore('VrstaPutnika').getAt(rowIndex).data.naziv;
                                    view.renderTo = '#vrstaputnikalist';
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
                        text: 'Dodaj vrstu putnika', 
                        id: 'openVrstaPutnikaForm'
                    }
                ]
            },
            {
                xtype: 'pagingtoolbar',
                store: 'VrstaPutnika',
                dock: 'bottom',
                displayInfo: true
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('vrstaputnikalist', Athene.view.vrstaputnika.List);