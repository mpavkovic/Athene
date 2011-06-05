Ext.define('Athene.model.PredmetRazrednogOdjeljenja', {
    extend: 'Ext.data.Model',
    proxy: {
        type: 'direct',
        api: {
            create: PredmetRazrednogOdjeljenja.save,
            read: PredmetRazrednogOdjeljenja.getAll,
            update: PredmetRazrednogOdjeljenja.update,
            destroy: PredmetRazrednogOdjeljenja.del
        },
        reader: {
            root: 'data'
        }
    },
    fields: [
             'id',
             'razredno_odjeljenje_id',
             //'razredno_odjeljenje',
             'predmet_id',
             'predmet',
             'ucitelj_id',
             'polugodiste',
             'realiziran_broj_sati'
             ],
    belongsTo: [
            'Predmet'
            ]
});