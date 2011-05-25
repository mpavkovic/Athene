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
                    {
                        xtype: 'actioncolumn',
                        width: 20,
                        items: [
                            {
                                icon: 'icons/blackboard_drawing.png',
                                tooltip: 'Nastavni plan'
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
                        icon: 'icons/add.png',
                        text: 'Nova školska godina', 
                        id: 'openSkGodForm'
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});