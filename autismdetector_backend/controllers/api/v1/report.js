const PatientReference = require('../../../models/PatientSchema');

const ReportReference = require('../../../models/Report');

const DoctorReference = require('../../../models/DoctorSchema');

const StatsReference = require('../../../models/Statistics');
module.exports.createReport =async function(req,res){
    try{
        let doctor = await DoctorReference.findById(req.user._id);
        //console.log(p);
        let reports = await ReportReference.create({status : req.body.status , date : `${new Date(Date.now()).toLocaleDateString().toString()}` , patient : req.params.id});
        // let stat = await StatsReference.updateOne({_id: user._id},{$set:{otp:val}});
        console.log('lessee',reports);
        await doctor.report.push(reports);
        //report reference added to the patient's database
        await doctor.save();
        return res.status(200).json({
            message : "Report Generated Successfully"
        });
    }
    catch(err){
        res.status(500).json({
            message : err
        });
    }
}
//Controller added to create report

module.exports.allReports = async function(req,res){
    try{
        let doctor = await DoctorReference.findById(req.user._id).populate('report').exec();
        return res.status(200).json({
            message : "All reports generated till date for the user",
            data : doctor.report,
        })
    }
    catch(err){
        return res.status(500).json({
            message: err
        });
    }
}
//Controller to get all report of a specific patient

module.exports.statusVise = async function(req,res){
    try{
        let reports = await ReportReference.find({ status: req.params.status }).populate('patient').exec();
        return res.status(200).json({
            message : "All reports with respective to the status generated",
            data : reports
        });
    }
    catch(err){
        return res.status(500).json({
            message: err
        });
    }
}
//Controller to get the report of all the patients with respect to status