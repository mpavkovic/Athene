Ext.define('Athene.view.dodijeljenapoteskoca.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.dodijeljenapoteskocalist',
    id: 'dodijeljenapoteskocalist',
    
    title: 'Popis dodijeljenih poteškoća',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'dodijeljenapoteskocagrid',
                store: 'DodijeljenaPoteskoca',
                forceFit: true,
                columns: [
                    {
                        text: 'Učenik',
                        dataIndex: 'ucenik_id'
                    },
                    {
                        text: 'Vrsta poteškoće',
                        dataIndex: 'vrsta_poteskoce_id'
                    },
                    {
                        text: 'Datum od',
                        dataIndex: 'datum_od'
                    },
                    {
                        text: 'Datum do',
                        dataIndex: 'datum_do'
                    },
                    {
                        text: 'Klasa',
                        dataIndex: 'klasa'
                    },
                    {
                        text: 'Uruđbeni broj',
                        dataIndex: 'urudzbeni_broj'
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
                                    var view = Ext.widget('dodijeljenapoteskocaform');
                                    view.down('form').loadRecord(Ext.getStore('DodijeljenaPoteskoca').getAt(rowIndex));
                                    view.down('#formDodijeljenaPoteskocaSubmit').text = 'Spremi';
                                    view.title = 'Izmijeni: ' + Ext.getStore('DodijeljenaPoteskoca').getAt(rowIndex).data.ucenik_id;
                                    view.renderTo = '#dodijeljenapoteskocalist';
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
                        text: 'Dodaj dodijeljenu poteškoću', 
                        id: 'openDodijeljenaPoteskocaForm'
                    }
                ]
            },
            {
                xtype: 'pagingtoolbar',
                store: 'DodijeljenaPoteskoca',
                dock: 'bottom',
                displayInfo: true
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('dodijeljenapoteskocalist', Athene.view.dodijeljenapoteskoca.List);