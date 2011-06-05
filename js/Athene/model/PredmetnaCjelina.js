/*Ext.define('Athene.model.PredmetnaCjelina', {
    extend: 'Ext.data.Model',
    fields: ['id','naziv','predmet_id']
});
*/

Ext.define('Athene.model.PredmetnaCjelina', {
    extend: 'Ext.data.Model',
    proxy: {
        type: 'direct',
        api: {
            create: PredmetnaCjelina.save,
            read: PredmetnaCjelina.getAll,
            update: PredmetnaCjelina.update,
            destroy: PredmetnaCjelina.del
        },
        reader: {
            root: 'data'
        }
    },
    fields: [
        'id',
        'naziv',
        'predmet_id',
        'predmet'
    ],
    belongsTo: 'Predmet'
});