# Challenge 2

Salvaging resources from previous expeditions across the cosmos will
be important to sustain your mission. Though the crews of these old
missions have long since been rescued, their abandoned spaceships still have
valuable resources on board, locked behind password-protected doors.

The old crews only brought the hashed password databases back with
them. These are tables with the results of applying a [hash
function](https://en.wikipedia.org/wiki/Hash_function) to the
passwords. With a good hash function, it should be easy to check that
a password hashes to the correct value but almost impossible to go the
other way, i.e. to determine the password that produces a given hash.

Luckily for us, the passwords were hashed using the [MD5
algorithm](https://en.wikipedia.org/wiki/MD5), which is now [known to be
insecure](https://en.wikipedia.org/wiki/MD5#Security), so we can
determine the passwords before we set off using the program
we provide here.

You are given three text files (`secrets1/secrets1.txt`, `secrets2/secrets2.txt` and `secrets3/secrets3.txt`), each containing multiple MD5 hashes separated by a new line and you are asked to harness the GPU power of Baskerville to retrieve the passwords from the hashes. For this, you are also provided with the source code and build instructions of a program, written in CUDA, that uses brute force to find the password that was used to generate an MD5 hash.

Thankfully, one of our crew members remembers that the MD5 hashes in the `secrets1` directory were generated from numeric-only passwords, while the hashes in the other two directories were generated from alphanumeric passwords. This can significantly increase the speed of the brute-force attack by reducing its search space.

## Rules and Instructions

* Submit one non-array job for each of the three secrets. You are allowed to submit more jobs for the same file, if for example a previous job failed, but you should solve all hashes from each of the three secrets files in the same job.
* Keep the three `secrets` within your project directory and not in one of the team member's home directories. You can of course experiment in your home folder but we will only grade solutions that are found in the project folder.
* Each of the three `secrets` directories should include four files only. Those are the `secrets#.txt` file with the hashes that we provide, a job submission script, a `slurm-*.out` file and a `slurm-*.stats` file.

## Marking Scheme

* Up to 5 points for compiling the code.
* Up to 5 points for the job submission scripts.
* Up to 5 points for each of the first two sub-challenges.
* **Bonus:** Up to 7 points for the third sub-challenge plus 3, 2, 1 points for the team that correctly solves all hashes from the third sub-challenge first, second and third respectively.

for a maximum of 30 points.

Please also note that the challenge is designed in such a way that we will allocate the points for the first two sub-challenges at the end of the first day, but we will allocate and announce the points for the last sub-challenge in the morning of the second day.

## Requirements

* GNU Make
* Nvidia CUDA compiler

## Compilation

To compile the code on Baskerville we need to load a CUDA module and then:

```bash
$ make
```

The compilation step creates an executable file called `md5_gpu`.

## Usage

The program detects and uses all available CUDA-enabled GPUs within a single node. To run it:

```bash
$ ./md5_gpu --charset=CHARSET --hash=HASH

Info: # device(s) found
The password for MD5 hash HASH is PASSWORD
```

where:

* `CHARSET` is either `0` for numeric passwords or `1` for alphanumeric.
* `HASH` is an MD5 hash as 32 hexadecimal digits.

## Attribution

Forked from [iryont/md5-cracker](https://github.com/iryont/md5-cracker).

Modified by the Research Software Group at the University of Birmingham for use in BEAR Challenge 2023.
