Ext.define('Athene.view.najavaispita.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.najavaispitaform',
    id: 'najavaispitaform',
    
    title: 'Nova Najava Ispita',
    layout: 'fit',
    width: 400,
    height: 210,
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
			store: new Athene.store.PredmetRazrednogOdjeljenja({pageSize: 20, queryMode: 'remote'}),
			pageSize: 20,
			queryMode: 'remote',
                        store: 'PredmetRazrednogOdjeljenja',
                        fieldLabel: 'Predmet razrednog odjeljenja',
                        displayField: 'predmet_id',
                        valueField: 'id',
						name: 'predmet_razrednog_odjeljenja_id'
                    },
                    {
                        xtype: 'combo',
                        id: 'comboNajavaIspitaNajavaIspita',
			store: new Athene.store.NastavniSat({pageSize: 20, queryMode: 'remote'}),
			pageSize: 20,
			queryMode: 'remote',
                        store: 'NastavniSat',
                        fieldLabel: 'Nastavni sat',
                        displayField: 'opis',
                        valueField: 'id',
						name: 'nastavni_sat_id'
                    },
                    {
                        xtype: 'combo',
                        id: 'comboNajavaIspitaKategorijaOcjena',
			store: new Athene.store.KategorijaOcjena({pageSize: 20, queryMode: 'remote'}),
			pageSize: 20,
			queryMode: 'remote',
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
				scope: me,
				handler: function() {
					me.down('form').getForm().submit({
			success: function(form, action) {    
			Ext.widget('notification').popup({
			message: 'Najava ispita je uspješno dodana',
			icon: 'img/icons/accept.png'
			});
			// Create a new record from form data
			var r = Ext.ModelManager.create(form.getValues(), 'Athene.model.NajavaIspita');
			// Add new record to store
			Ext.getStore('NajavaIspita').add(r);
			// Resort
			Ext.getStore('NajavaIspita').sort();
			},
					failure: function(form, action) {
			Ext.widget('notification').popup({
			message: 'Najava ispita nije dodana (greška)',
			icon: 'img/icons/exclamation.png'
			});
					}
			})
				}
			}
                ]
            }
        ];
        
        this.callParent(arguments);
    }
});