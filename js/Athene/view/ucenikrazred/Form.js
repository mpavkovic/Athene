Ext.define('Athene.view.ucenikrazred.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.ucenikrazredform',
    id: 'ucenikrazredform',
    
    title: 'Novi ucenik u razredu',
    layout: 'fit',
    width: 400,
    height: 150,
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
                    submit: UcenikRazred.save
                },
    
                items: [
                    {
                        xtype: 'combo',
                        id: 'comboUcenikRazred',
                        store: new Athene.store.Ucenik({pageSize: 20, queryMode: 'remote'}),
						pageSize: 20,
						queryMode: 'remote',
                        fieldLabel: 'Učenik',
                        displayField: 'prezime',
                        valueField: 'oib',
						name: 'ucenik_id',
						listConfig: {
						loadingText: 'Tražim...',
	                    emptyText: 'Nema rezultata.',
	                    // Custom rendering template for each item
	                    getInnerTpl: function() {
	                        return '<div class="search-item">' +
	                            '<h3>{prezime} {ime}</h3>' +
	                            'OIB: {oib}' +
	                        '</div>';
							}
						}
					},
                    {
                        xtype: 'combo',
                        id: 'comboUcenikRazredRazred',
			store: new Athene.store.Razred({pageSize: 20, queryMode: 'remote'}),
			pageSize: 20,
			queryMode: 'remote',
						fieldLabel: 'Razred',
						store: 'Razred',
						displayField: 'naziv',
						valueField: 'id',
						name: 'razrednoodjeljenje_id'
                    },
                    {
                        xtype: 'combo',
                        id: 'comboUcenikRazredGodina',
			store: new Athene.store.SkolskaGodina({pageSize: 20, queryMode: 'remote'}),
			pageSize: 20,
			queryMode: 'remote',
                        store: 'SkolskaGodina',
                        fieldLabel: 'Šk. godina',
                        displayField: 'godina',
                        valueField: 'godina',
						name: 'skolska_godina_id'
                    }
                ],
                buttons:[
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
						Ext.widget('notification').popup('Uspješno dodan učenik u razred.');
						// Create a new record from form data
						var r = Ext.ModelManager.create(form.getValues(), 'Athene.model.UcenikRazred');
						// Add new record to store
						Ext.getStore('UcenikRazred').add(r);
						// Resort
						Ext.getStore('UcenikRazred').sort();
						},
						failure: function(form, action) {
						Ext.widget('notification').popup({
						message: 'Učenik je već dodan u razred',
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