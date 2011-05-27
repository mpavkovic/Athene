Ext.onReady(function() {
    
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
                msgTarget: 'under',
                regex: /[a-zA-Z0-9_]{6,20}/i,
                regexText: 'Korisničko ime nije validno!'
            },
            {
                fieldLabel: 'Lozinka',
                inputType: 'password',
                name: 'password',
                allowBlank: false,
                msgTarget: 'under'
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
            }
        ],
        renderTo: Ext.getBody()
    });
    
});