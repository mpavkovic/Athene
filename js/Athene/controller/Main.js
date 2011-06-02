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

// Add override
/*Ext.override(Ext.form.field.ComboBox, {
    setValue: function(v) {
        //console.log('Setting combo value to ', v, this);
        //begin patch
        // Store not loaded yet? Set value when it *is* loaded.
        // Defer the setValue call until after the next load.
        if (this.store.getCount() == 0) {
            console.log('Load store...');
            /*this.store.on('load',
                this.setValue.createDelegate(this, [v]), null, {single: true});*
            this.store* /
            this.store.load({
                callback: function() {
                    console.log('kolbek mater ti jebem');
                    this.setValue(v);
                },
                scope: this
            })
            return;
        }
        var text = v;
        if(this.valueField){
            console.log('valueField is set');
            var r = this.findRecord(this.valueField, v);
            console.log('jebote r', r);
            if(r){
                console.log('Imam r');
                text = r.data[this.displayField];
            }else if(this.valueNotFoundText !== undefined){
                console.log('neam r, iam vnft')
                text = this.valueNotFoundText;
            }
        }
        this.lastSelectionText = text;
        if(this.hiddenField){
            this.hiddenField.value = v;
        }
        console.log(text);
        Ext.form.ComboBox.superclass.setValue.call(this, text);
        this.value = v;
        
        
        /*else {
            var r = this.store.findRecord(this.valueField, v);
            
            if(this.valueField){
            var r = this.findRecord(this.valueField, v);
            console.log(r);
            if(r){
                //text = r.data[this.displayField];
                Ext.form.ComboBox.superclass.setValue.call(this, r);
                this.value = v;
            }else if(this.valueNotFoundText !== undefined){
                text = this.valueNotFoundText;
            }
        }*/
        /*this.lastSelectionText = text;
        if(this.hiddenField){
            this.hiddenField.value = v;
        }
        Ext.form.ComboBox.superclass.setValue.call(this, text);*/
        //this.value = v;
        
            /*console.log(r);
            if(r === null) {
                console.log('nema');
                this.store.nextPage({
                    callback: function() {
                        //console.log(this.store.data);
                        this.setValue(v);
                    },
                    scope: this
                });
            } else {
                console.log('ima');
                //this.store.clearFilter();
                //this.clearValue();
                Ext.form.ComboBox.superclass.setValue.call(this, v);
                this.value = v;
            }* /
        }
        
        // Try to find the record in the store, if not, do remote lookup
        /*if(v !== undefined) {
            this.store.remoteFind({
                params: {
                    findBy: this.valueField,
                    findValue: v
                },
                callback: function(data) {
                    
                    //this.valueNotFoundText = data.naziv;
                    //this.value = data.naziv;
                    //console.log(data, this);
                    //return;
                    
                    this.store.loadRecords([data]);
                    Ext.form.ComboBox.superclass.setValue.call(this, v);
                },
                scope: this
            });
        } else {
            console.log('kurac pička sisa');
            this.value = v;
        }*/
        
//end patch
        /*console.log(this.valueField, v);
        console.log(this.store.data);
        var r = this.store.findRecord(this.valueField, v);
        if(r === null) {
            console.log('Load next page...');
            var _p = {
                    //start: ((this.store.currentPage+1)*this.store.pageSize)-this.store.pageSize,
                    page: this.store.currentPage+1
                    //limit: this.store.pageSize
                };
            console.log(_p);
            this.store.load({
                params: _p,
                callback: function() {
                    console.log('Loaded next page.');
                    this.setValue(v);
                },
                scope: this
            })
        }
        console.log(r);
        /*var text = v;
        if(this.valueField){
            var r = this.findRecord(this.valueField, v);
            console.log(r);
            if(r){
                //text = r.data[this.displayField];
                Ext.form.ComboBox.superclass.setValue.call(this, r);
                this.value = v;
            }else if(this.valueNotFoundText !== undefined){
                text = this.valueNotFoundText;
            }
        }*/
        /*this.lastSelectionText = text;
        if(this.hiddenField){
            this.hiddenField.value = v;
        }
        Ext.form.ComboBox.superclass.setValue.call(this, text);* /
        //this.value = v;* /
    }
});*/
 

Ext.define('Athene.controller.Main', {
    extend: 'Ext.app.Controller',
    
    views: [
        'Debug',
        'Viewport',
        'PopupMessage',
        'Tip'
    ],
    
    models: [
        'Tip'
    ],
    
    
    init: function() {
        
        Ext.apply(Ext.form.field.VTypes, {
            
            jmbg:  function(v) {
		if (checkJMBG(v)==true)
                return /^[0-9]{13}$/.test(v);
            },
	    
            oib:  function(v) {
		if (checkOIB(v)==true)
		    return /^[0-9]{11}$/.test(v)
            },
	    
            num: function(v){
                return /^[0-9]+$/.test(v)
            },
            
            jmbgText: 'Jmbg se sastoji od 13 brojeva',
            oibText: 'OIB nije ispravan.',
            numText: 'Ovo polje dozvoljava samo brojeve',
            jmbgMask: /[0-9]/i,
            oibMask: /[0-9]/i,
            numMask: /[0-9]/i
            
        });
        
        this.control({
            /*'viewport': {
                render: this.showTip
            },*/
            '#logout': {
                click: function() {
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
    },
    
    showTip: function() {
        if(SHOW_TIPS) {
            console.log(this.getTipModel());
            var tip = this.getTipModel().get('random');
            console.log(tip);
        }
    }
    
});