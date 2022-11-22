import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:preview/constants/Appstyle.dart';
import 'package:preview/widgets/confirmpopup.dart';
import 'package:preview/widgets/currentScore.dart';
import 'package:preview/widgets/nameChange.dart';
import 'package:preview/widgets/scoreIncrease.dart';

class tapcard extends StatefulWidget {
  VoidCallback onTap;
  List data;
  Function onIncrease;
  int index;
  int size;
  Function onDelete;
  Function editName;
  tapcard(
      {super.key,
      required this.data,
      required this.index,
      required this.onDelete,
      required this.onIncrease,
      required this.onTap,
      required this.editName,
      required this.size});

  @override
  State<tapcard> createState() => _tapcardState();
}

class _tapcardState extends State<tapcard> {
  @override
  Widget build(BuildContext context) {
    String name = widget.data[0];
    int score = widget.data[1];
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 0),
        child: InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return CurrentScore(data: widget.data);
                });
          },
          child: Slidable(
            endActionPane: ActionPane(motion: BehindMotion(), children: [
              SlidableAction(
                spacing: 5,
                backgroundColor: AppStyle.accentColor,
                borderRadius: BorderRadius.circular(5),
                onPressed: (context) {
                  showDialog(
                    context: context,
                    builder: ((context) {
                      return NameChange(
                        data: widget.data,
                        editName: widget.editName,
                        index: widget.index,
                      );
                    }),
                  );
                },
                icon: Icons.edit,
                label: 'edit',
              ),
              SlidableAction(
                borderRadius: BorderRadius.circular(5),
                backgroundColor: Colors.red,
                onPressed: (context) {
                  showDialog(
                    context: context,
                    builder: ((context) => widget.size == 1
                        ? AlertDialog(
                            titlePadding: EdgeInsets.all(24),
                            backgroundColor: AppStyle.bgCardColor,
                            title: const Text(
                                'You cannot delete the last person in the scoreboard'),
                          )
                        : ConfirmPopUp(confirmAction: widget.onDelete)),
                  );
                },
                icon: Icons.delete,
                label: 'delete',
              ),
            ]),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppStyle.bgCardColor,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                boxShadow: AppStyle.borderShadow,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: AppStyle.mainTitle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    score.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return ScoreIncrease(
                                data: [widget.data],
                                onIncrease: widget.onIncrease,
                                index: widget.index,
                              );
                            });
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 30.0,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
