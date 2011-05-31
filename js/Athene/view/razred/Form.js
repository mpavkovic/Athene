var popis_razreda = Ext.create('Ext.data.Store', {
    fields: ['abbr','naziv'],
    data : [
        {"abbr":"1", "naziv":"prvi"},
        {"abbr":"2", "naziv":"drugi"},
        {"abbr":"3", "naziv":"treći"},
        {"abbr":"4", "naziv":"četvrti"},
        {"abbr":"5", "naziv":"peti"},
        {"abbr":"6", "naziv":"šesti"},
        {"abbr":"7", "naziv":"sedmi"},
        {"abbr":"8", "naziv":"osmi"}
    ]
});
Ext.define('Athene.view.razred.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.razredform',
    id: 'razredform',
    
    title: 'Novi razred',
    layout: 'fit',
    width: 300,
    height: 235,
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
                    submit: Razred.save
                },
    
                items: [
                    {
                        xtype: 'textfield',
                        name: 'naziv',
                        fieldLabel: 'Naziv',
                        allowBlank: false,
			maxLength: 30	
                    },
                    {
                        xtype: 'combo',
                        id: 'comboRazredRazred',
			fieldLabel: 'Razred',
			store: popis_razreda,
			queryMode: 'local',
			displayField: 'naziv',
			valueField: 'abbr',
			name: 'razred'
                    },
                    {
                        xtype: 'combo',
                        id: 'comboRazredGodina',
                        store: 'SkolskaGodina',
                        fieldLabel: 'Šk. godina',
                        displayField: 'godina',
                        valueField: 'godina',
			name: 'skolska_godina_id'
                    },
                    {
                        xtype: 'combo',
                        id: 'comboRazredRazrednik',
                        store: 'Ucitelj',
                        fieldLabel: 'Razrednik',
                        displayField: 'prezime',
                        valueField: 'id',
			name: 'razrednik_id',
			listConfig: {
			    loadingText: 'Tražim...',
	                    emptyText: 'Nema rezultata.',

	                    // Custom rendering template for each item
	                    getInnerTpl: function() {
	                        return '<div class="search-item">' +
	                            '<h3>{prezime} {ime}</h3>' +
	                        '</div>';
			    }
			}
                    },
                    {
                        xtype: 'textfield',
                        name: 'klasa',
                        fieldLabel: 'Klasa',
                        allowBlank: false,
			maxLength: 200
                    },
                    {
                        xtype: 'textfield',
                        name: 'urudzbeni_broj',
                        fieldLabel: 'Uruđbeni broj',
                        allowBlank: false,
			maxLength: 200
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
				    Ext.widget('notification').popup('Razredno odjeljenje uspješno dodano.');
				    var RazredRecord = Ext.data.Record.create(['id', 'naziv', 'razred', 'skolska_godina_id', 'razrednik_id', 'klasa', 'urudzbeni_broj']);
				    ////console.log(form);
				    //var r = new RazredRecord();
				    //me.down('form').getForm().updateRecord(r);
				    ////console.log(r);
				    //Ext.getStore('Razred').add(r);
				    //ds.PartnersCombo.add(myrec);
				    //me.down('form').getForm().reset();
				    
				},
	                        failure: function(form, action) {
				    Ext.widget('notification').popup({
					message: action.result.message,
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