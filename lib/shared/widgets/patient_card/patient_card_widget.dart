import 'package:flutter/material.dart';
import 'package:mobile/shared/models/Patient/patient_model.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_text_styles.dart';

class PatientCardWidget extends StatefulWidget {
  final PatientModel patient;
  const PatientCardWidget({super.key, required this.patient});

  @override
  State<PatientCardWidget> createState() => _PatientCardWidgetState();
}

class _PatientCardWidgetState extends State<PatientCardWidget> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: AppColors.primary)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            IconButton(
              onPressed: () {
                setState(() {
                  expanded = !expanded;
                });
              },
              icon: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(expanded ? Icons.expand_less : Icons.expand_more),
              ),
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.patient.name} (${widget.patient.age} anos)',
                      style: TextStyles.patientCardName,
                    ),
                    Text('Contato: ${widget.patient.contactNumber}',
                        style: TextStyles.patientCardContactNumber),
                  ]),
            ),
          ]),
          expanded
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Text(
                            "Dados Pessoais",
                            style: TextStyles.personalDataHeader,
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            color: AppColors.primary,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Data de nascimento: ",
                            style: TextStyles.patientDataSubtitle,
                          ),
                          TextSpan(text: widget.patient.birthDate)
                        ],
                        style: TextStyles.patientData,
                      ),
                    ),
                    widget.patient.CPF != ""
                        ? Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "CPF: ",
                                  style: TextStyles.patientDataSubtitle,
                                ),
                                TextSpan(text: widget.patient.CPF)
                              ],
                              style: TextStyles.patientData,
                            ),
                          )
                        : const SizedBox(),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Estado civil: ",
                            style: TextStyles.patientDataSubtitle,
                          ),
                          TextSpan(text: widget.patient.maritalStatus)
                        ],
                        style: TextStyles.patientData,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Gênero: ",
                            style: TextStyles.patientDataSubtitle,
                          ),
                          TextSpan(text: widget.patient.gender)
                        ],
                        style: TextStyles.patientData,
                      ),
                    ),
                    widget.patient.email != null
                        ? Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Email: ",
                                  style: TextStyles.patientDataSubtitle,
                                ),
                                TextSpan(text: widget.patient.email)
                              ],
                              style: TextStyles.patientData,
                            ),
                          )
                        : const SizedBox(),
                    widget.patient.address != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 4),
                                    child: Text(
                                      "Dados Auxiliares",
                                      style: TextStyles.personalDataHeader,
                                    ),
                                  ),
                                  const Expanded(
                                    child: Divider(
                                      color: AppColors.primary,
                                      thickness: 1,
                                    ),
                                  ),
                                ],
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Cidade: ",
                                      style: TextStyles.patientDataSubtitle,
                                    ),
                                    TextSpan(
                                        text:
                                            "${widget.patient.address?.city} - ${widget.patient.address?.state}")
                                  ],
                                  style: TextStyles.patientData,
                                ),
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Bairro: ",
                                      style: TextStyles.patientDataSubtitle,
                                    ),
                                    TextSpan(
                                        text: widget.patient.address?.district)
                                  ],
                                  style: TextStyles.patientData,
                                ),
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "CEP: ",
                                      style: TextStyles.patientDataSubtitle,
                                    ),
                                    TextSpan(
                                        text: widget.patient.address?.zipCode)
                                  ],
                                  style: TextStyles.patientData,
                                ),
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Logradouro: ",
                                      style: TextStyles.patientDataSubtitle,
                                    ),
                                    TextSpan(
                                        text:
                                            widget.patient.address?.publicArea)
                                  ],
                                  style: TextStyles.patientData,
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                    widget.patient.liable != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 4),
                                    child: Text(
                                      "Dados do Responsável",
                                      style: TextStyles.personalDataHeader,
                                    ),
                                  ),
                                  const Expanded(
                                    child: Divider(
                                      color: AppColors.primary,
                                      thickness: 1,
                                    ),
                                  ),
                                ],
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Nome: ",
                                      style: TextStyles.patientDataSubtitle,
                                    ),
                                    TextSpan(
                                        text: "${widget.patient.liable?.name}")
                                  ],
                                  style: TextStyles.patientData,
                                ),
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "CPF: ",
                                      style: TextStyles.patientDataSubtitle,
                                    ),
                                    TextSpan(text: widget.patient.liable?.CPF)
                                  ],
                                  style: TextStyles.patientData,
                                ),
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Data de nascimento: ",
                                      style: TextStyles.patientDataSubtitle,
                                    ),
                                    TextSpan(
                                        text: widget.patient.liable?.birthDate)
                                  ],
                                  style: TextStyles.patientData,
                                ),
                              ),
                              widget.patient.liable?.email != null
                                  ? Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Email: ",
                                            style:
                                                TextStyles.patientDataSubtitle,
                                          ),
                                          TextSpan(
                                              text:
                                                  widget.patient.liable?.email)
                                        ],
                                        style: TextStyles.patientData,
                                      ),
                                    )
                                  : const SizedBox()
                            ],
                          )
                        : const SizedBox()
                  ],
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
