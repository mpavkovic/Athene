Ext.define('Athene.controller.Main', {
    extend: 'Ext.app.Controller',
    
    views: [
        'Viewport',
        'PopupMessage'
    ],
    
    
    init: function() {
        
        Ext.apply(Ext.form.field.VTypes, {
            
            jmbg:  function(v) {
                return /^[0-9]{13}$/.test(v);
            },
             oib:  function(v) {
                return /^[0-9]{11}$/.test(v);
            },
            num: function(v){
                return /^[0-9]+$/.test(v);
            },
            
            jmbgText: 'Jmbg se sastoji od 13 brojeva',
            oibText: 'OIB se sastoji od 11 brojeva',
            numText: 'Ovo polje dozvoljava samo brojeve',
            jmbgMask: /[0-9]/i,
            oibMask: /[0-9]/i,
            numMask: /[0-9]/i
            
        });
        
        this.control({
            '#logout': {
                click: function() {
                    console.log('Log me out!');
                    Ext.Ajax.request({
                        url: 'ext.php',
                        method: 'GET',
                        params: {
                            logout: true
                        }
                    });
                    window.location.reload();
                }
            },
			'#openPomocForm': {
                click: this.help
            }
        });
    },
	
    help: function() {
        Ext.Ajax.request({
            url: 'help/index.html',
            success: function(response) {
                var view = Ext.widget('helpwindow');
                view.update(response.responseText);
                view.setTitle(view.title + 'Pomoć pri korištenju aplikacije');
                view.show();
            },
            failure: function() {
                Ext.Msg.alert("Greška", "Nemogu učitati pomoć za zatraženu stavku.");
            }
        })
    }
    
});