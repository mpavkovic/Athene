Ext.define('Athene.view.najavaispita.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.najavaispitalist',
    id: 'najavaispitalist',
    
    title: 'Popis najava ispita',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
	
	tools: [
        {
            type: 'help',
            id: 'helpNajavaIspita',
            qtip: 'Pomoæ'
        }
    ],
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'najavaispitagrid',
                store: 'NajavaIspita',
                forceFit: true,
                columns: [
                    {
                        text: 'Datum',
                        dataIndex: 'datum'
                    },
                    {
                        text: 'Predmet razrednog odjeljenja',
                        dataIndex: 'predmet_razrednog_odjeljenja_id'
                    },
                    {
                        text: 'Nastavni sat',
                        dataIndex: 'nastavni_sat_id'
                    },
                    {
                        text: 'Kategorija ocjena',
                        dataIndex: 'kategorija_ocjena_id'
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
                        text: 'Dodaj najavaispita', 
                        id: 'openNajavaIspitaForm'
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('najavaispitalist', Athene.view.najavaispita.List);