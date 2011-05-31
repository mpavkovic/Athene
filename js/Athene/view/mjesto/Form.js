Ext.define('Athene.view.mjesto.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.mjestoform',
    id: 'mjestoform',
    
    title: 'Novo Mjesto',
    layout: 'fit',
    width: 300,
    height: 130,
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
                    submit: Mjesto.save
                },
    
                items: [
                    {
                        xtype: 'textfield',
                        name: 'naziv',
                        fieldLabel: 'Naziv',
                        allowBlank: false,
			maxLength: 200
                    },
                    {
                        xtype: 'combo',
                        id: 'comboMjesto',
                        store: new Athene.store.Drzava({pageSize:50, queryMode: 'remote'}), // 10.000 - da budemo sigurni
			//store: 'DrzavaCombo',
			pageSize: 50,
			queryMode: 'remote',
                        fieldLabel: 'Država',
                        displayField: 'naziv',
                        valueField: 'id',
			name: 'drzava_id',
			typeAhead: true,
			forceSelection: true
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
			id: 'formMjestoSubmit',
                        handler: function() {
			    var form = this.up('form').getForm(); // shorthand
			    // If record is loaded that means we're editing existing data
			    if(form.getRecord() !== undefined) {
				// Update record
			    } else {
				var r = Ext.ModelManager.create(form.getFieldValues(), 'Mjesto');
				console.log(r);
			    }
			    //console.log(this.up('form').getForm().getRecord());
                            //console.log(this.up('form').getForm().getFieldValues());
                        }
                    }
                ]
            }
        ];
        
        this.callParent(arguments);
    }
});