Ext.define('Athene.view.narodnost.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.narodnostlist',
    id: 'narodnostlist',
    
    title: 'Popis narodnosti',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'narodnostgrid',
                store: 'Narodnost',
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
                                    var view = Ext.widget('narodnostform');
                                    view.down('form').loadRecord(Ext.getStore('Narodnost').getAt(rowIndex));
                                    view.down('#formNarodnostSubmit').text = 'Spremi';
                                    view.title = 'Izmijeni: ' + Ext.getStore('Narodnost').getAt(rowIndex).data.naziv;
                                    view.renderTo = '#narodnostlist';
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
                        text: 'Dodaj narodnost',
                        id: 'openNarodnostForm'
                    }
                ]
            },
            {
                xtype: 'pagingtoolbar',
                store: 'Narodnost',
                dock: 'bottom',
                displayInfo: true
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('narodnostlist', Athene.view.narodnost.List);