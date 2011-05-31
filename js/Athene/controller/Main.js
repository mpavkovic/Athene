function checkOIB(oib) {
    oib = oib.toString();
    if (oib.length != 11) return false;

var b = parseInt(oib, 10);
if (isNaN(b)) return false;

var a = 10;
for (var i = 0; i < 10; i++) {
    a = a + parseInt(oib.substr(i, 1), 10);
    a = a % 10;
    if (a == 0) a = 10;
    a *= 2;
    a = a % 11;
}
var kontrolni = 11 - a;
if (kontrolni == 10) kontrolni = 0;
    return kontrolni == parseInt(oib.substr(10, 1));
}

function checkJMBG(jmbg){
    x = jmbg;
    
    if (x.length != 13) return false;
    
    a = 7*(x[0]*1+x[6]*1) + 6*(x[1]*1+x[7]*1) + 5*(x[2]*1+x[8]*1) + 4*(x[3]*1+x[9]*1) + 3*(x[4]*1+x[10]*1) + 2*(x[5]*1+x[11]*1);
    b = a%11;
    sum = 11 - b;
      
    if (sum != x[12]*1) return false;
	else return true;    
    
}

// oib = 18198789796; //valid OIB
 

Ext.define('Athene.controller.Main', {
    extend: 'Ext.app.Controller',
    
    views: [
        'Viewport',
        'PopupMessage'
    ],
    
    
    init: function() {
        
        Ext.apply(Ext.form.field.VTypes, {
            
            jmbg:  function(v) {
		if (checkJMBG(v)==true)
                return /^[0-9]{13}$/.test(v);
            },
	    
            oib:  function(v) {
		if (checkOIB(v)==true)
		    return /^[0-9]{11}$/.test(v);
            },
	    
            num: function(v){
                return /^[0-9]+$/.test(v);
            },
            
            jmbgText: 'Jmbg se sastoji od 13 brojeva',
            oibText: 'OIB nije ispravan.',
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