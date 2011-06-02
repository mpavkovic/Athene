Ext.define('Athene.view.predmetrazrednogodjeljenja.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.predmetrazrednogodjeljenjalist',
    id: 'predmetrazrednogodjeljenjalist',
    
    title: 'Popis Predmeta razrednog odjeljenja',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'predmetrazrednogodjeljenjagrid',
                store: 'PredmetRazrednogOdjeljenja',
                forceFit: true,
                columns: [
                    {
                        text: 'Razredno odjeljenje',
                        dataIndex: 'razredno_odjeljenje_id'
                    },
                    {
                        text: 'Predmet',
                        dataIndex: 'predmet_id'
                    },
                    {
                        text: 'Učitelj',
                        dataIndex: 'ucitelj_id'
                    },
                    {
                        text: 'Polugodište',
                        dataIndex: 'polugodiste'
                    },
                    {
                        text: 'Realiziran broj sati',
                        dataIndex: 'realiziran_broj_sati'
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
                                    var view = Ext.widget('predmetrazrednogodjeljenjaform');
                                    view.down('form').loadRecord(Ext.getStore('PredmetRazrednogOdjeljenja').getAt(rowIndex));
                                    view.down('#formPredmetRazrednogOdjeljenjaSubmit').text = 'Spremi';
                                    view.title = 'Izmijeni: ' + Ext.getStore('PredmetRazrednogOdjeljenja').getAt(rowIndex).data.razredno_odjeljenje_id;
                                    view.renderTo = '#adresalist';
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
                        text: 'Dodaj predmet razrednog odjeljenja', 
                        id: 'openPredmetRazrednogOdjeljenjaForm'
                    }
                ]
            },
            {
                xtype: 'pagingtoolbar',
                store: 'PredmetRazrednogOdjeljenja',
                dock: 'bottom',
                displayInfo: true
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('predmetrazrednogodjeljenjalist', Athene.view.predmetrazrednogodjeljenja.List);