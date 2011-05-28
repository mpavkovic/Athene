Ext.define('Athene.view.najavaispita.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.najavaispitaform',
    id: 'najavaispitaform',
    
    title: 'Nova Najava Ispita',
    layout: 'fit',
    width: 300,
    height: 260,
    constrain: true,
       
    initComponent: function() {
	var me = this;
        this.items = [
            {
                xtype: 'form',
                bodyPadding: 5,
                layout: 'anchor',
                defaults: {
                    anchor: '100%'
                },
                
                api: {
                    submit: NajavaIspita.save
                },
    
                items: [
                    {
                        xtype: 'datefield',
                        name: 'datum',
                        fieldLabel: 'Datum',
                        format: 'd.m.Y.',
                        submitFormat: 'Y-m-d',
                        allowBlank: false
                    },
                    {
                        xtype: 'combo',
                        id: 'comboNajavaIspitaPredRazOdj',
                        store: 'PredmetRazrednogOdjeljenja',
                        fieldLabel: 'Predmet razrednog odjeljenja',
                        displayField: 'predmet_id',
                        valueField: 'id',
						name: 'predmet_razrednog_odjeljenja_id'
                    },
                    {
                        xtype: 'combo',
                        id: 'comboNajavaIspitaNajavaIspita',
                        store: 'NastavniSat',
                        fieldLabel: 'Nastavni sat',
                        displayField: 'opis',
                        valueField: 'id',
						name: 'nastavni_sat_id'
                    },
                    {
                        xtype: 'combo',
                        id: 'comboNajavaIspitaKategorijaOcjena',
                        store: 'KategorijaOcjena',
                        fieldLabel: 'Kategorija Ocjena',
                        displayField: 'naziv',
                        valueField: 'id',
						name: 'kategorija_ocjena_id'
                    }
                ],
                buttons: [
		    {
			text: 'Odustani',
			handler: function() {
			   me.close();
			}
		    },
                    {
                        text: 'Dodaj',
                        handler: function() {
                            this.up('form').getForm().submit();
                        }
                    }
                ]
            }
        ];
        
        this.callParent(arguments);
    }
});