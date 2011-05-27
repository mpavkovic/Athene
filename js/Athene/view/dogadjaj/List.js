Ext.define('Athene.view.dogadjaj.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.dogadjajlist',
    id: 'dogadjajlist',
    
    title: 'Popis događaja',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'dogadjajgrid',
                store: 'Dogadjaj',
                forceFit: true,
                columns: [
                    {
                        text: 'Naziv',
                        dataIndex: 'naziv'
                    },
                    {
                        text: 'Opis',
                        dataIndex: 'opis'
                    },
					{
						text: 'Datum',
						dataIndex: 'datum'
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
                        text: 'Dodaj događaj', 
                        id: 'openDogadjajForm'
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('dogadjajlist', Athene.view.dogadjaj.List);