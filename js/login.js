Ext.onReady(function() {
    
    function doLogin(form) {
        if (form.isValid()) {
            form.submit({
                success: function() {
                    // Reload
                    window.location.reload();
                },
                failure: function(form, action) {
                    obj = Ext.JSON.decode(action.response.responseText);
                    Ext.Msg.alert('Greška', obj.errors.reason, function() {
                        form.reset();
                        form.findField('username').focus();
                    });
                }
            })
        }
    }
    
    Ext.create('Ext.form.Panel', {
        url: 'login.php',
        title: 'Prijava',
        bodyPadding: 5,
        style: 'margin: 20px auto;',
        width: 350,
        layout: 'anchor',
        defaults: {
            anchor: '100%'
        },
        defaultType: 'textfield',
        items: [
            {
                fieldLabel: 'Korisničko ime',
                name: 'username',
                allowBlank: false,
                maskRe: /[a-zA-Z0-9_]/i,
                maxLength: 20,
                enforceMaxLength: true,
                msgTarget: 'under',
                regex: /[a-zA-Z0-9_]/i,
                regexText: 'Korisničko ime nije validno!',
                listeners: {
                    specialkey: function(field, e) {
                        if(e.getKey() == e.ENTER) {    
                            var form = field.up('form').getForm();
                            doLogin(form);
                        }
                    },
                    render: function(el) {
                        el.focus();
                    }
                }
	    },
            {
                fieldLabel: 'Lozinka',
                inputType: 'password',
                name: 'password',
                allowBlank: false,
                msgTarget: 'under',
                listeners: {
                    specialkey: function(field, e) {
                        console.log('bla');
                        if(e.getKey() == e.ENTER) {    
                            var form = field.up('form').getForm();
                            doLogin(form);
                        }
                    }
                }
            },
            {
                fieldLabel: 'Zapamti me',
                xtype: 'checkbox'
            }
        ],
        buttons: [
            {
                text: 'Prijava',
                formBind: true,
                disabled: true,
                handler: function() {
                    var form = this.up('form').getForm();
                    doLogin(form);
                }
            }
        ],
        renderTo: Ext.getBody()
    });
    
});