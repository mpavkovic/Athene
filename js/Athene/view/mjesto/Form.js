Ext.define('Athene.view.mjesto.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.mjestoform',
    id: 'mjestoform',
    
    title: 'Novo Mjesto',
    layout: 'fit',
    width: 400,
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
			store: new Athene.store.Drzava({pageSize: 20, queryMode: 'remote'}),
			pageSize: 20,
			queryMode: 'remote',
                        store: 'Drzava',
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
			    console.log(form.getFieldValues());
			    // If record is loaded that means we're editing existing data
			    //if(form.getRecord() !== undefined) {
				// Update record
			    //} else {
				var r = Ext.ModelManager.create(form.getFieldValues(), 'Athene.model.Mjesto');
				console.log(r);
				r.save();
			    //}
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