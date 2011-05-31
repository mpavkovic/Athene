Ext.define('Athene.view.ucenikrazred.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.ucenikrazredlist',
    id: 'ucenikrazredlist',
    title: 'Popis Učenika u razredima',
    layout: 'fit',
    width: 950,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'ucenikrazredgrid',
                store: 'UcenikRazred',
                forceFit: true,
                columns: [
                    {
                        text: 'Učenik',
                        dataIndex: 'ucenik_id'
                    },
                    {
                        text: 'Razredno odjeljenje',
                        dataIndex: 'razrednoodjeljenje_id'
                    },
                    {
                        text: 'Školska godina',
                        dataIndex: 'skolska_godina_id'
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
                                    //console.log(Ext.getStore('UcenikRazred').getAt(rowIndex));
                                    var view = Ext.widget('ucenikrazredform');
                                    view.down('form').loadRecord(Ext.getStore('UcenikRazred').getAt(rowIndex));
                                    view.down('#formUcenikRazredSubmit').text = 'Spremi';
                                    view.title = 'Izmijeni: ' + Ext.getStore('UcenikRazred').getAt(rowIndex).data.oib;
                                    view.renderTo = '#ucenikrazredlist';
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
                        text: 'Dodaj učenika u razred', 
                        id: 'openUcenikRazredForm'
                    },
                    {
                        xtype: 'button',
                        icon: 'img/icons/refresh.png',
                        text: 'Osvježi',
                        id: 'refreshUcenikRazredList'
                    },
                    '->',
                    {
                        xtype: 'textfield',
                        emptyText: 'traži po prezimenu...',
                        id: 'listUcenikRazredSearch',
                        fieldLabel: false
                    }
                ]
            },
            {
                xtype: 'pagingtoolbar',
                store: 'UcenikRazred',
                dock: 'bottom',
                displayInfo: true
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('ucenikrazredlist', Athene.view.ucenikrazred.List);