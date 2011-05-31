Ext.define('Athene.view.nacionalnamanjina.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.nacionalnamanjinalist',
    id: 'nacionalnamanjinalist',
    
    title: 'Popis nacionalnih manjina',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'nacionalnamanjinagrid',
                store: 'NacionalnaManjina',
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
                                    var view = Ext.widget('nacionalnamanjinaform');
                                    view.down('form').loadRecord(Ext.getStore('NacionalnaManjina').getAt(rowIndex));
                                    view.down('#formNacionalnaManjinaSubmit').text = 'Spremi';
                                    view.title = 'Izmijeni: ' + Ext.getStore('NacionalnaManjina').getAt(rowIndex).data.naziv;
                                    view.renderTo = '#nacionalnamanjinalist';
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
                        text: 'Dodaj nacionalnu manjinu', 
                        id: 'openNacionalnaManjinaForm'
                    }
                ]
            },
            {
                xtype: 'pagingtoolbar',
                store: 'NacionalnaManjina',
                dock: 'bottom',
                displayInfo: true
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('nacionalnamanjinalist', Athene.view.nacionalnamanjina.List);