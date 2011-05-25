Ext.define('Athene.model.Mjesto', {
    extend: 'Ext.data.Model',
    fields: ['id','naziv','drzava_id','post_br'],
    belongsTo: 'Drzava'
});