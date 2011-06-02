Ext.define('Athene.view.skolskagodina.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.skgodlist',
    id: 'skgodlist',
    
    title: 'Popis školskih godina',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'skgodgrid',
                store: 'SkolskaGodina',
                forceFit: true, // This will force all columns to resize to fit the width of
                // available grid space
                columns: [
                    {
                        dataIndex: 'godina',
                        text: 'Godina'
                    },
                    {
                        dataIndex: 'pocetak_sk_godine',
                        text: 'Početak školske godine',
                        // This renders the date in croatian locale (day.month.YEAR)
                        // Exception handling is probably not neccesary, but leave it
                        // TODO: Make it a separate function?
                        // TODO: Check this: Ext.util.Format.dateRenderer('m/d/Y')
                        renderer: function(value) {
                            try {
                                return Ext.Date.format(Ext.Date.parse(value, 'Y-m-d'), 'd.m.Y.');
                            } catch (e) {
                                Ext.Msg.alert("Error", "Error during date conversion: " + e);
                            }
                            return '#error';
                        }
                    },
                    {
                        dataIndex: 'kraj_sk_godine',
                        text: 'Kraj školske godine',
                        renderer: function(value) {
                            try {
                                return Ext.Date.format(Ext.Date.parse(value, 'Y-m-d'), 'd.m.Y.');
                            } catch (e) {
                                Ext.Msg.alert("Error", "Error during date conversion: " + e);
                            }
                            return '#error';
                        }
                    },
                    {
                        dataIndex: 'kraj_prvog_polugodista',
                        text: 'Kraj prvog polugodišta',
                        renderer: function(value) {
                            try {
                                return Ext.Date.format(Ext.Date.parse(value, 'Y-m-d'), 'd.m.Y.');
                            } catch (e) {
                                Ext.Msg.alert("Error", "Error during date conversion: " + e);
                            }
                            return '#error';
                        }
                    },
                    {
                        dataIndex: 'pocetak_drugog_polugodista',
                        text: 'Početak drugog polugodišta',
                        renderer: function(value) {
                            try {
                                return Ext.Date.format(Ext.Date.parse(value, 'Y-m-d'), 'd.m.Y.');
                            } catch (e) {
                                Ext.Msg.alert("Error", "Error during date conversion: " + e);
                            }
                            return '#error';
                        }
                    },
                    /*{
                        xtype: 'actioncolumn',
                        width: 20,
                        items: [
                            {
                                icon: 'img/icons/blackboard_drawing.png',
                                tooltip: 'Nastavni plan'
                            }
                        ]
                    }*/
                    {
                        xtype: 'actioncolumn',
                        width: 20,
                        items: [
                            {
                                icon: 'img/icons/application_form_edit.png',
                                tooltip: 'Izmijeni',
                                iconCls: 'editAction',
                                handler: function(grid, rowIndex, columnIndex) {
                                    var view = Ext.widget('skolskagodinaform');
                                    view.down('form').loadRecord(Ext.getStore('SkolskaGodina').getAt(rowIndex));
                                    view.down('#formSkolskaGodinaSubmit').text = 'Spremi';
                                    view.title = 'Izmijeni: ' + Ext.getStore('SkolskaGodina').getAt(rowIndex).data.godina;
                                    view.renderTo = '#skolskagodinalist';
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
                        text: 'Nova školska godina', 
                        id: 'openSkGodForm'
                    }
                ]
            },
            {
                xtype: 'pagingtoolbar',
                store: 'SkolskaGodina',
                dock: 'bottom',
                displayInfo: true
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('skgodlist', Athene.view.skolskagodina.List);